Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLw8F-0005SU-6E
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 19:42:41 +0000
From: Richard Weinberger <richard@nod.at>
To: Mathieu Malaterre <malat@debian.org>
Cc: MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com
Subject: Re: ubi: refuse attaching mtd3 - MLC NAND is not supported
Date: Thu, 24 May 2018 21:42:11 +0200
Message-ID: <2323678.8uickzfJaD@blindfold>
In-Reply-To: <CA+7wUsy+2AWtty+Eow3kkw5Y9XdTZFnKHp05m46zuv9HPZngrA@mail.gmail.com>
References: <CA+7wUsy+2AWtty+Eow3kkw5Y9XdTZFnKHp05m46zuv9HPZngrA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mathieu,

Am Donnerstag, 24. Mai 2018, 21:28:12 CEST schrieb Mathieu Malaterre:
> Hi Richard,
> 
> I cannot boot my MIPS Creator CI20 system anymore. Doing a git bisect leads to:
> 
> $ git bisect bad
> b5094b7f135be34630e3ea8a98fa215715d0f29d is the first bad commit
> commit b5094b7f135be34630e3ea8a98fa215715d0f29d
> Author: Richard Weinberger <richard@nod.at>
> Date:   Sat Mar 3 11:45:54 2018 +0100
> 
>     ubi: Reject MLC NAND
> 
>     While UBI and UBIFS seem to work at first sight with MLC NAND, you will
>     most likely lose all your data upon a power-cut or due to read/write
>     disturb.
>     In order to protect users from bad surprises, refuse to attach to MLC
>     NAND.
> 
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Richard Weinberger <richard@nod.at>
>     Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
>     Acked-by: Artem Bityutskiy <dedekind1@gmail.com>
> 
> :040000 040000 715242e81a7386bbc9ec5b10d0eb5138cd41ff3f
> a2c894baaef840fc9dce4e87f3370a66731fc770 M drivers
> 
> 
> On my system here is what I can see (screen + ttyUSB):
> 
> ## Booting kernel from Legacy Image at 88000000 ...
>    Image Name:   Linux-4.16.0+
>    Image Type:   MIPS Linux Kernel Image (uncompressed)
>    Data Size:    5890340 Bytes = 5.6 MiB
>    Load Address: 80010000
>    Entry Point:  80401550
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> 
> Starting kernel [    0.155993] cacheinfo: Failed to find cpu0 device node
> [    0.238335] ubi: refuse attaching mtd3 - MLC NAND is not supported
> [    0.244827] UBI error: cannot attach mtd3
> [    0.248838] ubi: refuse attaching mtd4 - MLC NAND is not supported
> [    0.255061] UBI error: cannot attach mtd4
> [    0.259413] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)
> [    0.267679] Rebooting in 10 seconds..
> 
> 
> This has been working great so far. If I understand correctly your
> commit, this is a sort of safe code path to avoid corrupted data upon
> power-cut. Is there a way for me to continue booting my system as-is
> (other than a git revert b5094b7f135be).

No. MLC is simply not supported and not safe to use.
With that commit we reflect the state of the code and stop giving wrong promises.

I can hardly believe that it has been working great so far, did you
ever do power-cut tests?
Or are there other mechanisms on your board that make MLC usable by UBI?
For example SLC-emulation.

Thanks,
//richard
