Received: from [202.181.134.16] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALZ2P-0002d0-Aa
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 02:22:49 +0000
Message-ID: <3FB83098.5070504@hectrix.com>
Date: Mon, 17 Nov 2003 10:21:12 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: Russ.Dill@asu.edu
References: <3F98EE07.20006@hectrix.com> <1068916696.17894.9.camel@localhost>
In-Reply-To: <1068916696.17894.9.camel@localhost>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Setting up compressed rootfs on DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Russ,

Thanks for your response. I thought no one was interested in my question.

On 11/16/2003 01:18 AM, Russ Dill wrote:
> On Fri, 2003-10-24 at 02:16, Selwyn Tang wrote:
> 
>>Hi all,
>>
>>I am used to running a DOC patched grub firmware on my DOC 2000 (16MB)
>>with nftl, following the instructions of Karim's book. Since the space
>>is running out, I am interested in using a compressed root fs.
>>
>>I followed mtd-jffs-HOWTO.txt (1.16) to build a compressed root fs on
>>DOC. That is, I copied my root fs to a ramdisk, dd'd it through gzip to
>>a compressed gz file, dd'd it to an offset of 1MB on /dev/mtd0 and
>>rdev'd the kernel image (967KB) about the offset and the device to be
>>used. Then I came to a problem of how to install the kernel on the DOC.
>>
>>The HOWTO says I can use any boot loader, like lilo, to install the
>>kernel, or just place the kernel on the device and boot from it
>>directly. I got confused here, as I am used to using a grub firmware,
>>which hooks to int 19h as a bios extension. When it is booted, it
>>understands the DOC and can load my kernel image from my root fs on the
>>ext2 partition on the DOC.
>>
>>But in here, how should I install my kernel image? I tried dd'ing it to
>>the start of my DOC, like creating a boot floppy, but it doesn't seem
>>like a boot device to the bios. Should I still install a grub firmware
>>and a small partition for storing my kernel image, and then dd my
>>compressed root fs after the partition? Or is there any other more
>>clever ways?
> 
> 
> you can't put files on raw nand flash like you can on nor flash. You
> need some sort of filesystem, and grub needs to understand that file
> system. The only compressed filesystem I know of that grub can read, is
> cramfs.
> 

Do you mean I still have to use a DOC patched Grub firmware, and dd my
root fs, prepared as a cramfs image, to my DOC? I really have no idea of
what I have to do exactly. Can you offer me some more details?

Selwyn
