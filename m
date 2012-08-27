Received: from mail1.windriver.com ([147.11.146.13])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5nqO-0004j7-1j
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 01:10:21 +0000
Message-ID: <503AC8F4.8000601@windriver.com>
Date: Mon, 27 Aug 2012 09:10:12 +0800
From: "Lu.Jiang" <lu.jiang@windriver.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
 <1345801261.2848.276.camel@sauron.fi.intel.com>
 <1345807465.2848.279.camel@sauron.fi.intel.com>
In-Reply-To: <1345807465.2848.279.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: lu.jiang@windriver.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2012年08月24日 19:24, Artem Bityutskiy 写道:
> On Fri, 2012-08-24 at 12:41 +0300, Artem Bityutskiy wrote:
>> On Wed, 2012-08-08 at 10:31 +0800, Jiang Lu wrote:
>>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>>> index 0fde9fc..efbcaef 100644
>>> --- a/drivers/mtd/ubi/build.c
>>> +++ b/drivers/mtd/ubi/build.c
>>> @@ -1275,7 +1275,7 @@ out:
>>>   	ubi_err("UBI error: cannot initialize UBI, error %d", err);
>>>   	return err;
>>>   }
>>> -module_init(ubi_init);
>>> +late_initcall(ubi_init);
>> The problem is that UBIFS, which is usually used on top of UBI, also
>> uses 'late_initcall()'. If we do this change, how do we guarantee that
>> UBIFS is initialized after UBI?
> Although, I think it is not really a problem and UBIFS can be
> initialized at any point - it does not depend on UBI being initialized.
>
Yes, it works fine with this change. UFIFS can be mount as rootfs device 
on SPI flash after ubi_init() change to late_initcall().

Jiang Lu
