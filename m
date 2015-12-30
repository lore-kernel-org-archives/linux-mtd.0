Received: from bear.ext.ti.com ([192.94.94.41])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEIlg-00008G-PX
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 15:34:30 +0000
From: "Franklin S Cooper Jr." <fcooper@ti.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: Testing generic empty page bit flips recovery
References: <5683E5CC.6020008@ti.com> <20151230154055.662b4df8@bbrezillon>
Message-ID: <5683F960.90901@ti.com>
Date: Wed, 30 Dec 2015 09:33:52 -0600
MIME-Version: 1.0
In-Reply-To: <20151230154055.662b4df8@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/30/2015 08:40 AM, Boris Brezillon wrote:
> Hi Franklin,
>
> On Wed, 30 Dec 2015 08:10:20 -0600
> "Franklin S Cooper Jr." <fcooper@ti.com> wrote:
>
>> I am trying to follow up on this discussion from this patch
>> set (https://patchwork.ozlabs.org/patch/539059/) which
>> suggested that Michael instead test the generic bitflips
>> recovery that is implemented by Boris "mtd: nand: properly
>> handle bitflips in erased pages" patchset
>> (http://lists.infradead.org/pipermail/linux-mtd/2015-September/061617.html).
>> I would like to test Boris patchset but first I need to
>> recreate the error that his patch is fixing.
>>
>> The error that the patchset is attempting to fix isn't
>> something I have ever encountered before. Currently I am
>> trying to reproduce this issue on a TI K2E evm that uses the
>> davinci nand driver. I flashed the nand's file-system
>> partition with a ubi filesystem and the board is currently
>> set to boot using the file-system on the nand. After about
>> 60 secs I cut the power from the board and boot the board
>> again. What I would expect is that the board will eventually
>> fail to mount the ubi filesystem but currently the board has
>> ran for over 24 hours and powered on and off over 1400 times
>> and its still mounting the file-system perfectly fine.
>>
>> Any suggestions on a test case that I can use to force the
>> empty page bit flips error?
>>
>>
> The davinci driver seems to support raw accesses, so you can try to
> apply this patch [1] against the mtd-utils tree (not sure it still
> applies cleany, but it should work with mtd-utils-1.5.1), and use the
> nandflipbits tool:
>
> # flash_erase /dev/mtdX <offset> 1
> # nandflipbits /dev/mtdX 1@<offset>
> # nanddump -f /tmp/dump -s <offset> -l <page-size> /dev/mtdX
>
> Without the patch, nanddump should complain about uncorrectable errors,
> and if you hexdump /dev/dump you should see the bitflip.
> If nanddump does not complain after applying my patch, then it means it
> fixes the "bitflips in erased pages" bug.
>
> Best Regards,
>
> Boris
>
> [1]http://lists.infradead.org/pipermail/linux-mtd/2014-November/056634.html

Hi Boris,

Thanks for the quick reply. I built mtd-utils with your
patch and ran the suggested commands on a 4.1 based kernel
without your kernel patchset and I didn't see your expected
output. The 4.1 based kernel hasn't had any changes to
davinci_nand or nand subsystem that would address this
bitflip error.

I'm currently going to attempt to run the same test on the
latest mainline.

Here is the output I received when I ran your suggested
commands on the 4.1 based kernel.Any
root@k2e-evm:~# ./flash_erase /dev/mtd4 4096 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@k2e-evm:~# ./nandflipbits /dev/mtd4 1@4096
root@k2e-evm:~# ./nanddump -f /tmp/dump -s 4096 -l 2048
/dev/mtd4
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
root@k2e-evm:~# hexdump /tmp/dump
0000000 fffd ffff ffff ffff ffff ffff ffff ffff
0000010 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000800

Any thoughts on why I'm not seeing the expected error?
