Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhLB1-0005D2-7x
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 16:56:08 +0000
Message-ID: <552AA390.3070700@nod.at>
Date: Sun, 12 Apr 2015 18:55:44 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <1427631197-23610-1-git-send-email-richard@nod.at>	<1427631197-23610-5-git-send-email-richard@nod.at>	<20150412161243.4ee7eb59@bbrezillon>	<552A98B3.5000202@nod.at>
 <20150412184330.73a62484@bbrezillon>
In-Reply-To: <20150412184330.73a62484@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.04.2015 um 18:43 schrieb Boris Brezillon:
> On Sun, 12 Apr 2015 18:09:23 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> Am 12.04.2015 um 16:12 schrieb Boris Brezillon:
>>> Hi Richard,
>>>
>>> Sorry for the late reply.
>>>
>>> On Sun, 29 Mar 2015 14:13:17 +0200
>>> Richard Weinberger <richard@nod.at> wrote:
>>>
>>>> This patch implements bitrot checking for UBI.
>>>> ubi_wl_trigger_bitrot_check() triggers a re-read of every
>>>> PEB. If a bitflip is detected PEBs in use will get scrubbed
>>>> and free ones erased.
>>>
>>> As you'll see, I didn't have much to say about the 'UBI bitrot
>>> detection' mechanism, so this review is a collection of
>>> nitpicks :-).
>>>
>>>>
>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>> ---
>>>>  drivers/mtd/ubi/build.c |  39 +++++++++++++
>>>>  drivers/mtd/ubi/ubi.h   |   4 ++
>>>>  drivers/mtd/ubi/wl.c    | 146 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 189 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>>>> index 9690cf9..f58330b 100644
>>>> --- a/drivers/mtd/ubi/build.c
>>>> +++ b/drivers/mtd/ubi/build.c
>>>> @@ -118,6 +118,9 @@ static struct class_attribute ubi_version =
>>>>  
>>>>  static ssize_t dev_attribute_show(struct device *dev,
>>>>  				  struct device_attribute *attr, char *buf);
>>>> +static ssize_t trigger_bitrot_check(struct device *dev,
>>>> +				    struct device_attribute *mattr,
>>>> +				    const char *data, size_t count);
>>>>  
>>>>  /* UBI device attributes (correspond to files in '/<sysfs>/class/ubi/ubiX') */
>>>>  static struct device_attribute dev_eraseblock_size =
>>>> @@ -142,6 +145,8 @@ static struct device_attribute dev_bgt_enabled =
>>>>  	__ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
>>>>  static struct device_attribute dev_mtd_num =
>>>>  	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
>>>> +static struct device_attribute dev_trigger_bitrot_check =
>>>> +	__ATTR(trigger_bitrot_check, S_IWUSR, NULL, trigger_bitrot_check);
>>>
>>> How about making this attribute a RW one, so that users could check
>>> if there's a bitrot check in progress.
>>
>> As the check will be initiated only by userspace and writing to the trigger
>> while a check is running will return anyway a EBUSY I don't really see
>> a point why userspace would check for it.
> 
> Sometime you just want to know whether something is running or not (in
> this case the bitrot check) without risking to trigger a new action...

Why would they care?
But I can add this feature, no problem.

>>
>>>>  
>>>>  /**
>>>>   * ubi_volume_notify - send a volume change notification.
>>>> @@ -334,6 +339,36 @@ int ubi_major2num(int major)
>>>>  	return ubi_num;
>>>>  }
>>>>  
>>>> +/* "Store" method for file '/<sysfs>/class/ubi/ubiX/trigger_bitrot_check' */
>>>> +static ssize_t trigger_bitrot_check(struct device *dev,
>>>> +				    struct device_attribute *mattr,
>>>> +				    const char *data, size_t count)
>>>> +{
>>>> +	struct ubi_device *ubi;
>>>> +	int ret;
>>>> +
>>>
>>> Maybe that's on purpose, but you do not check the value passed in data
>>> (in your documention you suggest to do an
>>> echo 1 > /sys/class/ubi/ubiX/trigger_bitrot_check).
>>
>> Yeah, the example using "1", but why should I limit it to it?
>> The idea was that any write will trigger a check.
> 
> Okay.
> 
> 
> [...]
> 
>>>> +		/*
>>>> +		 * e is member of a fastmap pool. We are not allowed to
>>>> +		 * remove it from that pool as the on-flash fastmap data
>>>> +		 * structure refers to it. Let's schedule a new fastmap write
>>>> +		 * such that the said PEB can get released.
>>>> +		 */
>>>> +		else {
>>>> +			ubi_schedule_fm_work(ubi);
>>>> +			spin_unlock(&ubi->wl_lock);
>>>> +
>>>> +			err = 0;
>>>> +		}
>>>
>>> Nitpick, but checkpatch complains about 'else' or 'else if' statements
>>> that are not on the '}' line.
>>
>> I like it as is because I can nicely place the comment above the else {.
>> And checkpatch is not our lawmaker.
> 
> You could put your comment after the braces.
> Anyway, you might dislike the coding style imposed by kernel
> developers/maintainers, but this is what keeps the kernel code
> consistent across the different subsystems.
> I agree that some checks done by checkpatch can be a bit restrictive in
> some cases (like the 80 characters limit), but I really think the
> braces and else[ if] placements should be enforced.
> This being said, this is your call to make, so I won't complain about
> it anymore ;-).

It is corner case which is not handled by the kernel coding style IMHO.
The sad thing is that checkpatch is not developed by kernel developers.

>>
>>>> +	}
>>>> +	else {
>>>> +		/*
>>>> +		 * Ignore read errors as we return only work related errors.
>>>> +		 * Read errors will be logged by ubi_io_read().
>>>> +		 */
>>>> +		err = 0;
>>>> +	}
>>>
>>> Nitpicking again, but you can avoid another level of indentation by
>>> doing the following:
>>>
>>> 	if (err != UBI_IO_BITFLIPS) {
>>> 		err = 0;
>>> 		goto out;
>>> 	}
>>>
>>> 	dbg_wl("found bitflips in PEB %d", e->pnum);
>>> 	spin_lock(&ubi->wl_lock);
>>> 	/* ... */
> 
> You didn't answer to that one.

Whoops.
Yeah, that makes sense!

Thanks,
//richard
