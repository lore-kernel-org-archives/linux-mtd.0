Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEMfQ-0007Fg-DL
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 19:44:18 +0000
Date: Wed, 30 Dec 2015 20:43:54 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
Cc: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: Testing generic empty page bit flips recovery
Message-ID: <20151230204354.337b863b@bbrezillon>
In-Reply-To: <56841D70.6090702@ti.com>
References: <5683E5CC.6020008@ti.com> <20151230154055.662b4df8@bbrezillon>
 <5683F960.90901@ti.com> <20151230170207.45e7fb01@bbrezillon>
 <56840911.7080404@ti.com> <20151230175938.69c319cb@bbrezillon>
 <56841842.7060102@ti.com> <20151230185348.4f0ad161@bbrezillon>
 <56841D70.6090702@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Dec 2015 12:07:44 -0600
"Franklin S Cooper Jr." <fcooper@ti.com> wrote:

> 
> 
> On 12/30/2015 11:53 AM, Boris Brezillon wrote:
> > On Wed, 30 Dec 2015 11:45:38 -0600
> > "Franklin S Cooper Jr." <fcooper@ti.com> wrote:
> >
> >>
> >> On 12/30/2015 10:59 AM, Boris Brezillon wrote:
> >>> On Wed, 30 Dec 2015 10:40:49 -0600
> >>> "Franklin S Cooper Jr." <fcooper@ti.com> wrote:
> >>>
> >>>> On 12/30/2015 10:02 AM, Boris Brezillon wrote:
> >>>>> On Wed, 30 Dec 2015 09:33:52 -0600
> >>>>> "Franklin S Cooper Jr." <fcooper@ti.com> wrote:
> >>>>>
> >>>>>> On 12/30/2015 08:40 AM, Boris Brezillon wrote:
> >>>>>>> Hi Franklin,
> >>>>>>>
> >>>>>>> On Wed, 30 Dec 2015 08:10:20 -0600
> >>>>>>> "Franklin S Cooper Jr." <fcooper@ti.com> wrote:
> >>>>>>>
> >>>>>>>> I am trying to follow up on this discussion from this patch
> >>>>>>>> set (https://patchwork.ozlabs.org/patch/539059/) which
> >>>>>>>> suggested that Michael instead test the generic bitflips
> >>>>>>>> recovery that is implemented by Boris "mtd: nand: properly
> >>>>>>>> handle bitflips in erased pages" patchset
> >>>>>>>> (http://lists.infradead.org/pipermail/linux-mtd/2015-September/061617.html).
> >>>>>>>> I would like to test Boris patchset but first I need to
> >>>>>>>> recreate the error that his patch is fixing.
> >>>>>>>>
> >>>>>>>> The error that the patchset is attempting to fix isn't
> >>>>>>>> something I have ever encountered before. Currently I am
> >>>>>>>> trying to reproduce this issue on a TI K2E evm that uses the
> >>>>>>>> davinci nand driver. I flashed the nand's file-system
> >>>>>>>> partition with a ubi filesystem and the board is currently
> >>>>>>>> set to boot using the file-system on the nand. After about
> >>>>>>>> 60 secs I cut the power from the board and boot the board
> >>>>>>>> again. What I would expect is that the board will eventually
> >>>>>>>> fail to mount the ubi filesystem but currently the board has
> >>>>>>>> ran for over 24 hours and powered on and off over 1400 times
> >>>>>>>> and its still mounting the file-system perfectly fine.
> >>>>>>>>
> >>>>>>>> Any suggestions on a test case that I can use to force the
> >>>>>>>> empty page bit flips error?
> >>>>>>>>
> >>>>>>>>
> >>>>>>> The davinci driver seems to support raw accesses, so you can try to
> >>>>>>> apply this patch [1] against the mtd-utils tree (not sure it still
> >>>>>>> applies cleany, but it should work with mtd-utils-1.5.1), and use the
> >>>>>>> nandflipbits tool:
> >>>>>>>
> >>>>>>> # flash_erase /dev/mtdX <offset> 1
> >>>>>>> # nandflipbits /dev/mtdX 1@<offset>
> >>>>>>> # nanddump -f /tmp/dump -s <offset> -l <page-size> /dev/mtdX
> >>>>>>>
> >>>>>>> Without the patch, nanddump should complain about uncorrectable errors,
> >>>>>>> and if you hexdump /dev/dump you should see the bitflip.
> >>>>>>> If nanddump does not complain after applying my patch, then it means it
> >>>>>>> fixes the "bitflips in erased pages" bug.
> >>>>>>>
> >>>>>>> Best Regards,
> >>>>>>>
> >>>>>>> Boris
> >>>>>>>
> >>>>>>> [1]http://lists.infradead.org/pipermail/linux-mtd/2014-November/056634.html
> >>>>>> Hi Boris,
> >>>>>>
> >>>>>> Thanks for the quick reply. I built mtd-utils with your
> >>>>>> patch and ran the suggested commands on a 4.1 based kernel
> >>>>>> without your kernel patchset and I didn't see your expected
> >>>>>> output. The 4.1 based kernel hasn't had any changes to
> >>>>>> davinci_nand or nand subsystem that would address this
> >>>>>> bitflip error.
> >>>>>>
> >>>>>> I'm currently going to attempt to run the same test on the
> >>>>>> latest mainline.
> >>>>>>
> >>>>>> Here is the output I received when I ran your suggested
> >>>>>> commands on the 4.1 based kernel.Any
> >>>>>> root@k2e-evm:~# ./flash_erase /dev/mtd4 4096 1
> >>>>>> Erasing 128 Kibyte @ 0 -- 100 % complete
> >>>>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 1@4096
> >>>>>> root@k2e-evm:~# ./nanddump -f /tmp/dump -s 4096 -l 2048
> >>>>>> /dev/mtd4
> >>>>>> ECC failed: 0
> >>>>>> ECC corrected: 0
> >>>>>> Number of bad blocks: 0
> >>>>>> Number of bbt blocks: 4
> >>>>>> Block size 131072, page size 2048, OOB size 64
> >>>>>> root@k2e-evm:~# hexdump /tmp/dump
> >>>>>> 0000000 fffd ffff ffff ffff ffff ffff ffff ffff
> >>>>>> 0000010 ffff ffff ffff ffff ffff ffff ffff ffff
> >>>>>> *
> >>>>>> 0000800
> >>>>>>
> >>>>>> Any thoughts on why I'm not seeing the expected error?
> >>>>>>
> >>>>> Oh, actually this behavior is explained in the commit message:
> >>>>>
> >>>>> "Currently empty page bit flips are not corrected and report 0 errors."
> >>>>>
> >>>>> Which explains why you're seeing the bitflip in the dump, but nothing
> >>>>> reported by the MTD layer.
> >>>>>
> >>>>> After applying my patch, the bitflip should simply disappear. You can
> >>>>> then try to generate more bitflips than the engine can actually fix
> >>>>> (nandflipbits /dev/mtd4 1@0:5@0:49@0:98@0:132@0) and check that MTD
> >>>>> reports an uncorrectable error.
> >>>> I verified that I am indeed using ecc4bit mode.
> >>>>
> >>>> I attempted to run the series of nandflipsbits as you
> >>>> suggested but I get "invalid bit description" error from the
> >>>> utility. Some reason I  can only use the nandflipsbits
> >>>> utility for bits 1-7. Anything higher and I get the "Invalid
> >>>> bit description" error.
> >>> Indeed. I developed that tool a long time ago and didn't remember that
> >>> the bit field is encoding the bit offset within a byte. This command
> >>> should work.
> >>>
> >>> nandflipbits /dev/mtd4 1@0:5@0:7@30:3@46:5@47
> >>>
> >>>> On the latest master commit I ran nandflipsbits for bits 1-7
> >>>> at address 0. However, I still didn't receive any error from
> >>>> nanddump although I do see the flip bits from the hexdump
> >>>> /tmp/dump output.
> >>> How many of them do you see?
> >>>
> >>>> I then applied your patchset ontop of the latest mainline
> >>>> and ran nandflipsbits for bits 1-7 at address 0.
> >>>> I get the below output which seems to be correct.
> >>>>
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 1@0
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 2@0
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 3@0
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 4@0
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 5@0
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 6@0
> >>>> root@k2e-evm:~# ./nandflipbits /dev/mtd4 7@0
> >>>> root@k2e-evm:~# ./nanddump -f /tmp/dump -s 0 -l 2048
> >>>> /dev/mtd4                                                                                                                                                           
> >>>>
> >>>> ECC failed: 1
> >>>> ECC corrected: 18
> >>>> Number of bad blocks: 0
> >>>> Number of bbt blocks: 4
> >>>> Block size 131072, page size 2048, OOB size 64
> >>>> Dumping data starting at 0x00000000 and ending at 0x00000800...
> >>>> ECC: 4 corrected bitflip(s) at offset 0x00000000
> >>>> root@k2e-evm:~# hexdump /tmp/dump
> >>>> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> >>>> *
> >>>> 0000800
> >>> Hm, that's weird. You should get an ECC failure since the ECC strength
> >>> is only 4bits/512byte and you 8 bits have been flipped.
> >>>
> >>>> One thing that confuses me is if I repeatedly call nanddump
> >>>> I continue to get the "ECC: 4 corrected bitflips" message
> >>>> and the "ECC corrected" count increases by 4 each time. If
> >>>> these bits are being corrected which is apparent from
> >>>> looking at the output of nanddump shouldn't sequential calls
> >>>> indicate that no bitflips needed to be corrected since it
> >>>> was corrected previously?
> >>> Nope, they're corrected on the fly and only in RAM, so each time you
> >>> read the page, you'll have to fix the bitflips until you erase and
> >>> rewrite the faulty block.
> >>>
> >>>
> >> Hi Boris,
> >>
> >> Here is the entire output that should answer your questions.
> >>
> >> In the log I am running the following commands:
> >> flash_erase /dev/mtd4 0 0
> >> ./nanddump -f /tmp/dump -s 0 -l 2048 /dev/mtd4
> >> hexdump /tmp/dump
> >> ./nandflipbits /dev/mtd4 1@0:5@0:7@30:3@46:5@47
> >> ./nanddump -f /tmp/dump -s 0 -l 2048 /dev/mtd4
> >> hexdump /tmp/dump
> >>
> >> Output on mainline kernel without bitflip correction patches:
> >> http://pastebin.com/MgBVxALR
> >>
> >> Output on mainline kernel with bitflip correction patches:
> >> http://pastebin.com/NdKv0NhV
> >>
> >> Some reason I'm only getting 1 bit being corrected when
> >> using the bitflip correction patches. Comparing my logs from
> >> before to now the only difference I'm seeing is that ECC
> >> failed is increasing but ECC corrected isn't changing.
> >>
> > That's what I was expecting: your ECC engine is only fixing
> > 4bits/512byte, which is why the bitflip in erased page correction fail
> > when you have more than 4 bits flipped in a given 512byte block.
> >
> > Now try to flip only 4 bits instead of 5:
> >
> > ./nandflipbits /dev/mtd4 1@0:5@0:7@30:3@46
> 
> Here is the output:
> root@k2e-evm:~/# ./flash_erase /dev/mtd4 0 1
> root@k2e-evm:~/# ./nanddump -f /tmp/dump -s 0 -l 2048 /dev/mtd4
> ECC failed: 5
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 4
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x00000800...
> root@k2e-evm:~/# hexdump /tmp/dump                           
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000800
> root@k2e-evm:~/# ./nandflipbits /dev/mtd4 1@0:5@0:7@30:3@46
> root@k2e-evm:~/# ./nanddump -f /tmp/dump -s 0 -l 2048 /dev/mtd4
> ECC failed: 5
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 4
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x00000800...
> ECC: 4 corrected bitflip(s) at offset 0x00000000
> root@k2e-evm:~/# hexdump /tmp/dump                           
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000800
> 
> Running nanddump again shows that 4 bits were corrected.
> So it seems like things are working as expected.
> 
> It seems like patches 2-5 from your patchset weren't pulled
> in because you and Brian wanted more testing on other
> platforms. If your going to submit a rev 4 please feel free
> to CC me so I can test the patches out and add a Tested-by.

Just sent a v4. Feel free to test it and add your
Tested-by/Acked-by/Reviewed-by.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
