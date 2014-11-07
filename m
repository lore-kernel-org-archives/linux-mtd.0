Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmnO6-0007wu-D7
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 17:31:55 +0000
Message-ID: <545D01F4.9050005@broadcom.com>
Date: Fri, 7 Nov 2014 09:31:32 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
 <545C8697.3080403@nod.at>
In-Reply-To: <545C8697.3080403@nod.at>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14-11-07 12:45 AM, Richard Weinberger wrote:
> Am 06.11.2014 um 22:56 schrieb Scott Branden:
>> It looks like the erase happening in the middle of reboot was uncovered in 2009 and never addressed properly?
>>
>> https://lkml.org/lkml/2009/6/9/16
>> https://lkml.org/lkml/2010/2/12/144
>>
>> Was there a proper resolution to this issue?
>
> Did you read the threads you've posted?
>
> There two answers:
> https://lkml.org/lkml/2010/2/12/143
Yes, there is no hardware solution to a reset happening in the middle of 
an erase operation to NAND.

> https://lkml.org/lkml/2010/2/12/144
Yes, it appears nobody has ever implemented a reboot notifier in the 
past 5 years to solve this problem for NAND.

We are experimenting with a notifier in UBI and MTD which is a much 
cleaner shutdown than just a notifier at the MTD level.  UBI reboot 
notifier priority needs to be shut down first and have a higher priority 
than flash device.  Overnight results are looking promising.
>
> Thanks,
> //richard
>
