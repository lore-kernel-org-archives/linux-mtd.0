Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm4pD-0002xh-4L
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 17:56:55 +0000
Message-ID: <545A64CF.20101@broadcom.com>
Date: Wed, 5 Nov 2014 09:56:31 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
In-Reply-To: <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
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

Hi Richard,

Thanks for the feedback.  Comments inline.

On 14-11-05 01:22 AM, Richard Weinberger wrote:
> On Wed, Nov 5, 2014 at 9:32 AM, Scott Branden <sbranden@broadcom.com> wrote:
>> We are doing reboot testing with UBIFS on the 3.10 kernel with a new chipset
>> we are working on.
>>
>> Over 1000's of reboots we eventually find that the NAND has uncorrectable
>> ECC errors reported on a random page when it is mounted.
>>
>> We have found the problem is that a NAND erase operation is in progress when
>> the reboot occurs. Since the NAND is in the middle of the erase operation
>> the page is mostly FF with some random bits not erased when the reboot
>> occurs.
>>
>> We suspect the problem is the asynchronous nature of the UBIFS operations.
>> Perhaps the small write buffer that can take 3-5 seconds to be written or
>> some other operation occuring in UBI/UBIFS?  I don't think the shutdown of
>> the filesystem is dealing with all the threads properly.
>
> And what about powercuts?
powercuts would exhibit the exact same behaviour as we are observing: 
the erase is interrupted by loss of power so the NAND block being erased 
would be in a partially erased state.  powercuts have little to do with 
the reboot sequence I am describing.

> UBI/UBIFS was designed to survive powercuts.
Yes, this does not cause UBIFS to fail to survive the powercut.  It does 
cause blocks to not be erased properly.

The block that didn't finish to erase is uncorrectable on next boot-up:

[    1.330000] UBI: attaching mtd7 to ubi0
[    2.000000] iproc_nand 18046000.nand: uncorrectable error at 0x18700000

This issue is this blocks shouldn't be corrupted in the first place if 
UBI/UBIFS shut downs properly.

> If your NAND shows strange issues even after a clean reboot something nasty is
> going on. Does your driver pass all UBI/MTD test?
>
We are in the process of running the MTD tests.  But this appears to 
have nothing to do with a buggy driver or not.  The NAND driver will do 
what it is told to do.  If it is told to erase a block it will erase a 
block.  It can't control if the system reboots in the middle of this 
operation?

This appears to be a UBI/UBIFS issue.  UBI/UBIFS operations are still 
going on after the filesystem in unmounted.  The shutdown process 
completes and a reboot happens.  My guess is these operations are due to 
the asynchronous threads of UBI/UBIFS not being handled properly during 
the shutdown process?

I have found other people have reported unexplained flash corruption. 
We back ported this to the 3.10 kernel which solved most of the flash 
corruption issues:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/fs/super.c?id=807612db2f9940b9fa6deaef054eb16d51bd3e00

This only remaining flash corruption issue is due to the described issue 
of reboot happening in the middle of an erase cycle.
