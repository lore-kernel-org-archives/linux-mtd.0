Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rz8Na-0004cb-UP
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2012 15:08:48 +0000
Message-ID: <4F411076.9020105@linutronix.de>
Date: Sun, 19 Feb 2012 16:08:38 +0100
From: Richard Weinberger <rw@linutronix.de>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [RFC][PATCH 7/7] MTD: UBI: wire up checkpointing
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1329250006-22944-8-git-send-email-rw@linutronix.de>
 <20120219155741.4c2f0a02@pixies.home.jungo.com>
 <4F41026C.6060203@linutronix.de>
 <20120219164002.00e76895@pixies.home.jungo.com>
In-Reply-To: <20120219164002.00e76895@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, tim.bird@am.sony.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.02.2012 15:40, schrieb Shmulik Ladkani:
> On Sun, 19 Feb 2012 15:08:44 +0100 Richard Weinberger<rw@linutronix.de>  wrote:
>> Am 19.02.2012 14:57, schrieb Shmulik Ladkani:
>>> On Tue, 14 Feb 2012 21:06:46 +0100 Richard Weinberger<rw@linutronix.de>   wrote:
>>>> +#ifdef CONFIG_MTD_UBI_CHECKPOINT
>>>> +static int attach_by_checkpointing(struct ubi_device *ubi)
>>>> +{
>>>> +	int cp_start, err;
>>>> +	struct ubi_scan_info *si;
>>>> +
>>>> +	cp_start = ubi_find_checkpoint(ubi);
>>>> +	if (cp_start<   0)
>>>> +		return -ENOENT;
>>>> +
>>>> +	si = ubi_read_checkpoint(ubi, cp_start);
>>>> +	if (IS_ERR(si))
>>>> +		return PTR_ERR(si);
>>>> +
>>>> +	ubi->bad_peb_count = 0;
>>>> +	ubi->good_peb_count = ubi->peb_count;
>>>
>>> Zero reported bad PEBs when checkpointing.
>>> Seems that checkpointing does not remember number/location of bad PEBs.
>>
>> Currently checkpointing cares only about used and free PEBs.
>> Bad PEBs are no longer visible to UBI after recovering from a checkpoint.
>
> Ok.
> However it is still reported to the log in 'ubi_attach_mtd_dev'
> and as a sysfs attribute.
> BTW, the counter is still incremented by WL subsystem, though.
> Hence, reported value will be bad PEBs encountered since last attach
> (where formerly, it was absolute total bad PEBs in the ubi device).
> Maybe remove 'bad_peb_count' altogether.
>
> Also, "ubi->good_peb_count = ubi->peb_count" results in different
> 'beb_rsvd_level' caculation, see 'ubi_calculate_reserved'.

I can add these counters into the checkpoint.

>>> Are we fine with that?
>>
>> This patch is a RFC. :-)
>
> So I noticed :-)
> Just trying to point out things which cause ubi system to behave
> differently.
>

Thanks a lot for reviewing this feature!
//richard
