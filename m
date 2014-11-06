Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmV3N-0000Ap-6p
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 21:57:17 +0000
Message-ID: <545BEEA5.7020609@broadcom.com>
Date: Thu, 6 Nov 2014 13:56:53 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Richard Weinberger
 <richard.weinberger@gmail.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com>
In-Reply-To: <545AAA2B.8090007@broadcom.com>
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

It looks like the erase happening in the middle of reboot was uncovered 
in 2009 and never addressed properly?

https://lkml.org/lkml/2009/6/9/16
https://lkml.org/lkml/2010/2/12/144

Was there a proper resolution to this issue?



On 14-11-05 02:52 PM, Scott Branden wrote:
> On 14-11-05 10:21 AM, Richard Weinberger wrote:
>> Hi!
>>
>> Am 05.11.2014 um 18:56 schrieb Scott Branden:
>>> Hi Richard,
>>>
>>> Thanks for the feedback.  Comments inline.
>>>
>>> On 14-11-05 01:22 AM, Richard Weinberger wrote:
>>>> On Wed, Nov 5, 2014 at 9:32 AM, Scott Branden
>>>> <sbranden@broadcom.com> wrote:
>>>>> We are doing reboot testing with UBIFS on the 3.10 kernel with a
>>>>> new chipset
>>>>> we are working on.
>>>>>
>>>>> Over 1000's of reboots we eventually find that the NAND has
>>>>> uncorrectable
>>>>> ECC errors reported on a random page when it is mounted.
>>>>>
>>>>> We have found the problem is that a NAND erase operation is in
>>>>> progress when
>>>>> the reboot occurs. Since the NAND is in the middle of the erase
>>>>> operation
>>>>> the page is mostly FF with some random bits not erased when the reboot
>>>>> occurs.
>>>>>
>>>>> We suspect the problem is the asynchronous nature of the UBIFS
>>>>> operations.
>>>>> Perhaps the small write buffer that can take 3-5 seconds to be
>>>>> written or
>>>>> some other operation occuring in UBI/UBIFS?  I don't think the
>>>>> shutdown of
>>>>> the filesystem is dealing with all the threads properly.
>>>>
>>>> And what about powercuts?
>>> powercuts would exhibit the exact same behaviour as we are observing:
>>> the erase is interrupted by loss of power so the NAND block being
>>> erased would be in a partially erased
>>> state.  powercuts have little to do with the reboot sequence I am
>>> describing.
>>>
>>>> UBI/UBIFS was designed to survive powercuts.
>>> Yes, this does not cause UBIFS to fail to survive the powercut.  It
>>> does cause blocks to not be erased properly.
>>
>> Makes sense.
>>
>>> The block that didn't finish to erase is uncorrectable on next boot-up:
>>>
>>> [    1.330000] UBI: attaching mtd7 to ubi0
>>> [    2.000000] iproc_nand 18046000.nand: uncorrectable error at
>>> 0x18700000
>>>
>>> This issue is this blocks shouldn't be corrupted in the first place
>>> if UBI/UBIFS shut downs properly.
>>>
>>>> If your NAND shows strange issues even after a clean reboot
>>>> something nasty is
>>>> going on. Does your driver pass all UBI/MTD test?
>>>>
>>> We are in the process of running the MTD tests.  But this appears to
>>> have nothing to do with a buggy driver or not.  The NAND driver will
>>> do what it is told to do.  If it is told
>>> to erase a block it will erase a block.  It can't control if the
>>> system reboots in the middle of this operation?
>>>
>>> This appears to be a UBI/UBIFS issue.  UBI/UBIFS operations are still
>>> going on after the filesystem in unmounted.  The shutdown process
>>> completes and a reboot happens.  My guess is
>>> these operations are due to the asynchronous threads of UBI/UBIFS not
>>> being handled properly during the shutdown process?
>>>
>>> I have found other people have reported unexplained flash corruption.
>>> We back ported this to the 3.10 kernel which solved most of the flash
>>> corruption issues:
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/fs/super.c?id=807612db2f9940b9fa6deaef054eb16d51bd3e00
>>>
>>>
>>> This only remaining flash corruption issue is due to the described
>>> issue of reboot happening in the middle of an erase cycle.
>>
>> You can verify your hypothesis easily. Add a printk() to
>> ubi_detach_mtd_dev(). This function shuts down UBI and also the
>> background thread which does
>> all erase work.
> Hi Richard,
>
> The printk never happens.
>
> I only find ubi_detach_mtd_dev can be called by ubi_exit.   But ubi_exit
> is only called if it is a module...
>
> static void __exit ubi_exit(void)
> {
>      int i;
>
>      for (i = 0; i < UBI_MAX_DEVICES; i++)
>          if (ubi_devices[i]) {
>              mutex_lock(&ubi_devices_mutex);
>              ubi_detach_mtd_dev(ubi_devices[i]->ubi_num, 1);
>              mutex_unlock(&ubi_devices_mutex);
>          }
>      ubi_debugfs_exit();
>      kmem_cache_destroy(ubi_wl_entry_slab);
>      misc_deregister(&ubi_ctrl_cdev);
>      class_remove_file(ubi_class, &ubi_version);
>      class_destroy(ubi_class);
> }
> module_exit(ubi_exit);
>
>>
>> Thanks,
>> //richard
>>
>
