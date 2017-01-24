Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cW4XU-0003qm-I5
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 17:05:50 +0000
Received: from localhost.localdomain ([127.0.0.1]:38132 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S23993935AbdAXRDMp02ET (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Tue, 24 Jan 2017 18:03:12 +0100
Date: Tue, 24 Jan 2017 18:03:05 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Sebastien Decourriere <sebtx452@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness
 swap is enabled
Message-ID: <20170124170305.GA26937@linux-mips.org>
References: <1484904834-14980-1-git-send-email-sebtx452@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484904834-14980-1-git-send-email-sebtx452@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 20, 2017 at 10:33:54AM +0100, Sebastien Decourriere wrote:

> The purpose of this patch is to enable the software address endianness
> swapping only when the in SoC EBU endianness swapping is disabled.
> To perform this check, I look at Bit 30 of the EBU_CON_0 register.
> Actually, the driver expects that the in SoC swapping is disabled.
> This is the case with current bootloaders shuch as U-boot.
> 
> This applies only to vr9 (xrx200) rev 1.2 and ar10 (xrx300).
> 
> I have a router which uses a proprietary bootloader which keeps
> the in SoC swapping enabled. The SoC in this router is a vrx200 v1.2.
> In this SoC version, I can keep the in SoC swapping without any problem.
> 
> This patch replaces my previous broken patch.
> 
> Signed-off-by: Sebastien Decourriere <sebtx452@gmail.com>
>  .../mips/include/asm/mach-lantiq/xway/lantiq_soc.h |  1 +
>  drivers/mtd/maps/lantiq-flash.c                    | 29 +++++++++++++++++++---

Acked-by: Ralf Baechle <ralf@linux-mips.org>

for the trivial MIPS bit.

  Ralf
