Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALoe-00050P-LQ
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:38:33 +0000
Received: by ewy3 with SMTP id 3so510030ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 05:38:31 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: add switch to support NAND flash on big
	endian bus
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
In-Reply-To: <1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:35:36 +0300
Message-ID: <1302784536.2796.34.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 15:55 +0200, Hans-Christian Egtvedt wrote:
> This patch adds a new kconfig symbol to the MTD NAND system, MTD_NAND_BE_BUS.
> This symbol is used by the nand base to properly convert the data read from the
> bus into the format the CPU expects.
> 
> The patch fixes 16-bit NAND flash support on big endian architectures (at least
> AVR32) with NAND flash hooked up to a big endian external bus.
> 
> Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

These kind of config options are bad and lead to confusion. You should
try hard to auto-detect the endianness, or take this information from
the boot-loader via the device tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
