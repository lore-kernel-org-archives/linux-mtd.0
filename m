Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoWFF-0005CO-QD
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 10:33:22 +0000
Date: Thu, 5 Dec 2013 07:32:59 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC/PATCH] mtd: nand: Refactor print messages
Message-ID: <20131205103259.GA2345@localhost>
References: <1385379031-27766-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131205020137.GH27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131205020137.GH27149@ld-irv-0074.broadcom.com>
Cc: Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 04, 2013 at 06:01:37PM -0800, Brian Norris wrote:
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index bd39f7b..4bdc0df 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> ...
> > @@ -3372,8 +3374,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >  		id_data[i] = chip->read_byte(mtd);
> >  
> >  	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
> > -		pr_info("%s: second ID read did not match "
> > -			"%02x,%02x against %02x,%02x\n", __func__,
> > +		pr_info("second ID read did not match "
> > +			"%02x,%02x against %02x,%02x\n",
> 
> scripts/checkpatch.pl and Documentation/CodingStyle don't like this long
> string (even though it would be over 80 chars). I think we should combine them.
> 

You're right, user-visible strings shouldn't be splitted. The 80-char limit has
an exception about this (qouting Documentation/CodingStyle):

""
  Chapter 2: Breaking long lines and strings

[..]
Statements longer than 80 columns will be broken into sensible chunks, unless
exceeding 80 columns significantly increases readability and does not hide
information. [..] However, never break user-visible strings such as printk
messages, because that breaks the ability to grep for them.
""

Regards!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
