Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnhFE-0005Qf-TS
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 05:10:29 +0000
Message-ID: <546048AB.6040602@broadcom.com>
Date: Sun, 9 Nov 2014 21:10:03 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
 <545C8697.3080403@nod.at> <545D01F4.9050005@broadcom.com>
 <545F3FD8.6010001@nod.at>
In-Reply-To: <545F3FD8.6010001@nod.at>
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

On 14-11-09 02:20 AM, Richard Weinberger wrote:
> Am 07.11.2014 um 18:31 schrieb Scott Branden:
>> On 14-11-07 12:45 AM, Richard Weinberger wrote:
>>> Am 06.11.2014 um 22:56 schrieb Scott Branden:
>>>> It looks like the erase happening in the middle of reboot was uncovered in 2009 and never addressed properly?
>>>>
>>>> https://lkml.org/lkml/2009/6/9/16
>>>> https://lkml.org/lkml/2010/2/12/144
>>>>
>>>> Was there a proper resolution to this issue?
>>>
>>> Did you read the threads you've posted?
>>>
>>> There two answers:
>>> https://lkml.org/lkml/2010/2/12/143
>> Yes, there is no hardware solution to a reset happening in the middle of an erase operation to NAND.
>
> Well, I agree with David that anything we do in software will only hide the real problem
> or trim down the window.
Hi Richard,

Currently the NAND does not shut down in a clean manner for a reboot 
operation.  This is due to the asynchronous ubi_thread make flash erase 
calls.  unmount is done properly in ubi already and cleanly shuts down. 
  reboot is not done in a clean manner as there is no reboot_notifier to 
handle the situation.

This is not hiding a real problem.  It is just shutting down ubi 
properly rather than pulling the power from it in the middle of operations.

In addition to this - a reboot_notifier needs to be added at the mtd 
level to shut it down properly as well.

This is not trimming down a window.  It is having the drivers shut down 
properly so they do not look like a power failure to the NAND device.

There is no solution to the power failure - it will corrupt pages in the 
middle of erasure.  And you do handle this in UBI/UBIFS.  But why 
corrupt other erase pages unnecessarily when all that needs to be done 
is shut down the drivers properly.  I don't know what you are agreeing 
with David with?  It is not making a window smaller.  It is changing the 
functionality so that the UBI and MTD drivers are shut down cleanly in 
reboot situations.  Right now, they are not shut down at all in these 
situations.
>
> Thanks,
> //richard
>
