Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhOiF-00057L-Vy
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 20:42:41 +0000
Message-ID: <552AD8A6.6000406@dave-tech.it>
Date: Sun, 12 Apr 2015 22:42:14 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking (linux-mtd Digest,
 Vol 145, Issue 24)
References: <mailman.40253.1428858576.22890.linux-mtd@lists.infradead.org>
 <mailman.40253.1428858576.22890.linux-mtd.{2b889d2f-ba39-4abc-aea3-8920fd29865f}.0@lists.infradead.org>
 <552AA390.3070700@nod.at>
In-Reply-To: <552AA390.3070700@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Il 12/04/2015 18:55, Richard Weinberger ha scritto:
> Am 12.04.2015 um 18:43 schrieb Boris Brezillon:
>> On Sun, 12 Apr 2015 18:09:23 +0200
>> Richard Weinberger <richard@nod.at> wrote:
>>
>>> Am 12.04.2015 um 16:12 schrieb Boris Brezillon:
>>>> Hi Richard,
>>>>
>>>> Sorry for the late reply.
>>>>
>>>> On Sun, 29 Mar 2015 14:13:17 +0200
>>>> Richard Weinberger <richard@nod.at> wrote:
>>>>
>>>>> This patch implements bitrot checking for UBI.
>>>>> ubi_wl_trigger_bitrot_check() triggers a re-read of every
>>>>> PEB. If a bitflip is detected PEBs in use will get scrubbed
>>>>> and free ones erased.
>>>>
>>>> As you'll see, I didn't have much to say about the 'UBI bitrot
>>>> detection' mechanism, so this review is a collection of
>>>> nitpicks :-).
>>>>
>>>>>
>>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>>> ---
>>>>>   drivers/mtd/ubi/build.c |  39 +++++++++++++
>>>>>   drivers/mtd/ubi/ubi.h   |   4 ++
>>>>>   drivers/mtd/ubi/wl.c    | 146 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>   3 files changed, 189 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>>>>> index 9690cf9..f58330b 100644
>>>>> --- a/drivers/mtd/ubi/build.c
>>>>> +++ b/drivers/mtd/ubi/build.c
>>>>> @@ -118,6 +118,9 @@ static struct class_attribute ubi_version =
>>>>>
>>>>>   static ssize_t dev_attribute_show(struct device *dev,
>>>>>   				  struct device_attribute *attr, char *buf);
>>>>> +static ssize_t trigger_bitrot_check(struct device *dev,
>>>>> +				    struct device_attribute *mattr,
>>>>> +				    const char *data, size_t count);
>>>>>
>>>>>   /* UBI device attributes (correspond to files in '/<sysfs>/class/ubi/ubiX') */
>>>>>   static struct device_attribute dev_eraseblock_size =
>>>>> @@ -142,6 +145,8 @@ static struct device_attribute dev_bgt_enabled =
>>>>>   	__ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
>>>>>   static struct device_attribute dev_mtd_num =
>>>>>   	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
>>>>> +static struct device_attribute dev_trigger_bitrot_check =
>>>>> +	__ATTR(trigger_bitrot_check, S_IWUSR, NULL, trigger_bitrot_check);
>>>>
>>>> How about making this attribute a RW one, so that users could check
>>>> if there's a bitrot check in progress.
>>>
>>> As the check will be initiated only by userspace and writing to the trigger
>>> while a check is running will return anyway a EBUSY I don't really see
>>> a point why userspace would check for it.
>>
>> Sometime you just want to know whether something is running or not (in
>> this case the bitrot check) without risking to trigger a new action...
>
> Why would they care?

I think is always useful to give some additional information in 
userspace, from both debugging and diagnostic point of view.

> But I can add this feature, no problem.

Thanks ;-)

May I ask if can be useful to abort the (IMHO quite long running) operation?
I think it can be useful to save power, e.g. when running on batteries: 
smart systems will trigger the operation when charging and aborting it 
if on batteries (or on low batteries).

What happens if the system need to reboot in the middle of scanning?
Probably nothing at all but I think it's worth asking ;-)
Anyway I think it's better if we can, on runlevel 6, shutdown the 
operation in a clean way

To ask a little bit more from the current implementation, can it be 
useful expand sysfs entry with the current status (stopped, running, 
completed)?
In this way the userspace knows whenever the operation it has triggered, 
it completed successfully or something interrupt it (e.g. an internal 
error). I will schedule a new operation sooner if I have no evidence 
that the last one completed successfully.. WDYT?
But maybe all of this stuff will be implemented inside a daemon with 
additional ioctl() (IIRC Richard already is working on this).

>
>>>
>>>>>
>>>>>   /**
>>>>>    * ubi_volume_notify - send a volume change notification.
>>>>> @@ -334,6 +339,36 @@ int ubi_major2num(int major)
>>>>>   	return ubi_num;
>>>>>   }
>>>>>
>>>>> +/* "Store" method for file '/<sysfs>/class/ubi/ubiX/trigger_bitrot_check' */
>>>>> +static ssize_t trigger_bitrot_check(struct device *dev,
>>>>> +				    struct device_attribute *mattr,
>>>>> +				    const char *data, size_t count)
>>>>> +{
>>>>> +	struct ubi_device *ubi;
>>>>> +	int ret;
>>>>> +
>>>>
>>>> Maybe that's on purpose, but you do not check the value passed in data
>>>> (in your documention you suggest to do an
>>>> echo 1 > /sys/class/ubi/ubiX/trigger_bitrot_check).
>>>
>>> Yeah, the example using "1", but why should I limit it to it?
>>> The idea was that any write will trigger a check.
>>
>> Okay.

See above my reason for having something more that 1 value (or having 
more than one sysfs entry ;-) )

Kind Regards,

Andrea SCIAN

-- 

Andrea SCIAN

DAVE Embedded Systems
