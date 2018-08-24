Date: Fri, 24 Aug 2018 14:48:10 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, <linux-mtd@lists.infradead.org>, Rob
 Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Jian Hu <jian.hu@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 <linux-amlogic@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet
 <jbrunet@baylibre.com>
Subject: Re: [RFC PATCH v2 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20180824144810.31c929a5@bbrezillon>
In-Reply-To: <96e538a5-1232-11f2-8b9e-5ddb09dcc2de@amlogic.com>
References: <20180719094612.5833-1-yixun.lan@amlogic.com>
 <20180719094612.5833-3-yixun.lan@amlogic.com>
 <20180801235045.5b4d8211@bbrezillon>
 <42877a0d-9830-0626-3f64-e49a326eaa3c@amlogic.com>
 <20180817155608.5929b37a@bbrezillon>
 <96e538a5-1232-11f2-8b9e-5ddb09dcc2de@amlogic.com>
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

On Wed, 22 Aug 2018 22:08:42 +0800
Liang Yang <liang.yang@amlogic.com> wrote:

> > You have to wait tWB, that's for sure.
> >   
> we have a maximum 32 commands fifo. when command is written into 
> NFC_REG_CMD, it doesn't mean that command is executing right now, maybe 
> it is buffering on the queue.Assume one ERASE operation, when 2nd 
> command(0xd0) is written into NFC_REG_CMD and then come into 
> NAND_OP_WAITRDY_INSTR, if I read the RB status by register, it may be 
> wrong because 0xd0 may not being executed. it is unusual unless 
> buffering two many command.

You should flush the queue and wait for it to empty at the end of
->exec_op().

> so it seems that i still need to use nand_soft_waitrdy or wait cmd is 
> executed somewhere.

Don't you have a WAIT_FOR_RB instruction? What is NFC_CMD_RB for? Also,
NFC_CMD_IDLE seems to allow you to add an arbitrary delay, and that's
probably what you should use for tWB.
