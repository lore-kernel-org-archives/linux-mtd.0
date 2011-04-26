Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEgA6-00008f-DJ
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 11:10:35 +0000
Subject: Re: [PATCH 2/2] mtd: add switch to support NAND flash on big
	endian bus
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: dedekind1@gmail.com
In-Reply-To: <1302784536.2796.34.camel@localhost>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<1302784536.2796.34.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 13:10:25 +0200
Message-ID: <1303816225.3125.3.camel@hcegtvedt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-14 at 15:35 +0300, Artem Bityutskiy wrote:
> On Wed, 2011-04-13 at 15:55 +0200, Hans-Christian Egtvedt wrote:
> > This patch adds a new kconfig symbol to the MTD NAND system, MTD_NAND_BE_BUS.
> > This symbol is used by the nand base to properly convert the data read from the
> > bus into the format the CPU expects.
> > 
> > The patch fixes 16-bit NAND flash support on big endian architectures (at least
> > AVR32) with NAND flash hooked up to a big endian external bus.
> > 
> > Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
> 
> These kind of config options are bad and lead to confusion. You should
> try hard to auto-detect the endianness, or take this information from
> the boot-loader via the device tree.

AVR32 doesn't support the device tree.

For AVR32 assuming big endian wiring on the EBI is sane, as the
architecture is big-endian only. I don't know how other big endian
architectures behaves, and I am puzzled that I am the only observer of
this...

-- 
Hans-Christian Egtvedt
