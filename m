From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F98EE07.20006@hectrix.com>
References: <3F98EE07.20006@hectrix.com>
Content-Type: text/plain
Message-Id: <1069060971.4490.50.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 17 Nov 2003 09:22:52 +0000
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

On Fri, 2003-10-24 at 17:16 +0800, Selwyn Tang wrote:
> Hi all,
> 
> I am used to running a DOC patched grub firmware on my DOC 2000 (16MB)
> with nftl, following the instructions of Karim's book. Since the space
> is running out, I am interested in using a compressed root fs.

There is no clever way to do this out of the box. If I needed this, I'd
do it as follows:

1. Fix the new NAND/DiskOnChip driver so it does hardware ECC and 
   correctly reads and enforces the Bad Block Table.

2. Use JFFS2 on your DiskOnChip.

3. Find/make a bootloader which can live in the DiskOnChip where
   Grub currently is and which groks JFFS2 so it can find and boot
   kernels from the file system. I'd probably use RedBoot for this,
   since the JFFS2 code is designed to work in eCos (on which
   RedBoot is based) and hence it shouldn't be hard to make
   JFFS2/NAND work in RedBoot.

You could skip step 3 if you put a tiny NFTL partition at the beginning
of the flash to hold the kernel, and just use JFFS2 on the rest.

-- 
dwmw2
