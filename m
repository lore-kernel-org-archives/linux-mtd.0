Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ekpIR-0004dh-Em
 for linux-mtd@lists.infradead.org; Sun, 11 Feb 2018 10:55:49 +0000
Date: Sun, 11 Feb 2018 11:55:25 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 0/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180211115525.4130772d@bbrezillon>
In-Reply-To: <20180208235921.31840-1-stefan@agner.ch>
References: <20180208235921.31840-1-stefan@agner.ch>
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

On Fri,  9 Feb 2018 00:59:18 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Third revision of the rework patchset to use exec_op for NXP
> Vybrid (and others) NAND Flash Controller.

Glad to see you didn't give up on that :-). It looks pretty good
already, just have some comments on patch 2, but I think you can drop
the RFC prefix on your next version.

> 
> I now avoided calling back into the stack for the ECC read/
> write pages. This increases speed 4469 KiB/s write speed and
> 13490 KiB/s read speed (v2 was 3495 KiB/s/13490 KiB/s).

Nice improvement on the write path.

> 
> IMHO it start to look better, probably still needs some fine
> tuning. What I don't like too much is that the custom
> read/write page accessors dupplicate some code, maybe this
> could be done somewhat nicer.

Hm, just had a look and I don't find there's that much code duplicated
here, but if you find a solution to share even more code I won't
complain ;-).

> 
> --
> Stefan
> 
> Changes in v3:
> - Separate exec_op() callback addition and removal of old callbacks
> - Push data into regs in one function
> - Readd op parser
> - Implement custom read/write page for hardware ECC
> - Rely on generic ecc.write_page_raw
> - Use nand_read_oob_op instead of nand_read_page_op
> 
> Stefan Agner (3):
>   mtd: nand: vf610_nfc: remove unused function
>   mtd: nand: vf610_nfc: make use of ->exec_op()
>   mtd: nand: vf610_nfc: remove old hooks
> 
>  drivers/mtd/nand/vf610_nfc.c | 493 +++++++++++++++++++++----------------------
>  1 file changed, 239 insertions(+), 254 deletions(-)
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
