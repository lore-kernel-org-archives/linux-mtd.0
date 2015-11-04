Received: from mail-yk0-x22d.google.com ([2607:f8b0:4002:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu2Gp-0000qu-5b
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 17:54:51 +0000
Received: by ykdr3 with SMTP id r3so85614279ykd.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 09:54:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <563A3155.9010306@ge.com>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
 <20151103212546.0184eaf6@bbrezillon>
 <CAAEAJfD3_TW4C6p7XU4bWrWxrhg4YRf-YK2QZu_vT3d7uwS4mw@mail.gmail.com>
 <20151103221812.013b5cc0@bbrezillon> <563A3155.9010306@ge.com>
Date: Wed, 4 Nov 2015 09:54:30 -0800
Message-ID: <CAN8TOE-fsZP0g5W+45tadnYM26okweTFxr+4sMxh6EbK_G8n2g@mail.gmail.com>
Subject: Re: nand_flash_detect_onfi error
From: Brian Norris <computersforpeace@gmail.com>
To: Renaud Barbier <renaud.barbier@ge.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 4, 2015 at 8:24 AM, Renaud Barbier <renaud.barbier@ge.com> wrote:
> My CPU is a Freescale P1014 supported by the driver
> drivers/mtd/nand/fsl_ifc_nand.c. Based on your information it seems the
> easiest path is to set the "read_bytes" count to 3 * 256 and program the
> controller to use this byte count when the CMD_PARAM command is used.

That's still a bit ugly. It'd be nice not to have to assume the read length...

Also, have you looked at NAND_CMD_RNDOUT support? That's required if
you need to read out the extended parameter page. See
nand_flash_detect_ext_param_page().

Brian
