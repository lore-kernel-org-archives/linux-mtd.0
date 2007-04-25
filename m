Received: from mga03.intel.com ([143.182.124.21])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgijC-0001bc-6A
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 10:44:23 -0400
Message-ID: <462F6938.90903@intel.com>
Date: Wed, 25 Apr 2007 18:44:08 +0400
From: akorolev <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Semih Hazar <semih.hazar@indefia.com>
Subject: Re: Slow NAND + JFFS2
References: <462F45B1.8020007@indefia.com>
In-Reply-To: <462F45B1.8020007@indefia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

You may try to clarify if compression is off.
> Hi,
>
> I'm using a 256 MiB NAND Flash from ST -> Manufacturer ID: 0x20, Chip 
> ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit) with JFFS2. The filesystem is 
> mounted as rootfs and the size is around 60 megs.
>
> Filesystem operations seem very slow to me. Such as:
>
> It takes almost 1 and a half minutes to copy a 30 meg file.
> Mounting the filesystem takes around 1 minute.
>
> # ls -lh
> -rw-r--r--    1 root     root        30.3M Jan  1 00:05 gcc.tgz
> # time cp gcc.tgz 1
> real    1m 22.37s
> user    0m 0.09s
> sys     1m 22.22s
> #
>
>
> This seemed really slow to me, but I don't have any other benchmarks. 
> Can someone comment on these values ?
>
> The processor is at32ap7000 from Atmel, running at 160 MHz.
> I'm running kernel 2.6.20.1 with cpu related patches from Atmel and our 
> own nand patches which are almost the replica of at91_nand.c (I can send 
> it if you need)
>
> I also changed the read enable and write enable pulse timings according 
> to the minimum values stated in NAND flash's datasheet.
>
> If this copy/mount time are really slow as I think, where should I check 
> ? Is this a JFFS2 related issue or should I try to find some problems in 
> our nand driver or ... ?
>
> Best regards,
> Semih Hazar
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
