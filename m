Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SBqX-0007lz-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2002 08:25:09 +0100
Message-Id: <200207100723.g6A7Nwf06288@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: add_mtd_partition question
Date: Wed, 10 Jul 2002 08:23:58 +0100
Cc: linux-mtd@lists.infradead.org
References: <200207091032.g69AWUV27220@localhost.localdomain> <15331.1026217135@redhat.com>
In-Reply-To: <15331.1026217135@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I think this is probably a more correct fix. If you could let me know if it 
looks ok, if so then I'll commit it.

Index: mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.27
diff -r1.27 mtdpart.c
72a73,88
> static int part_read_user_prot_reg (struct mtd_info *mtd, loff_t from, 
size_t len,
>                       size_t *retlen, u_char *buf)
> {
>       struct mtd_part *part = PART(mtd);
>       return part->master->read_user_prot_reg (part->master, from,
>                                       len, retlen, buf);
> }
>
> static int part_read_fact_prot_reg (struct mtd_info *mtd, loff_t from, 
size_t len,
>                       size_t *retlen, u_char *buf)
> {
>       struct mtd_part *part = PART(mtd);
>       return part->master->read_user_prot_reg (part->master, from,
>                                       len, retlen, buf);
> }
>
100a117,124
> static int part_write_user_prot_reg (struct mtd_info *mtd, loff_t from, 
size_t len,
>                       size_t *retlen, u_char *buf)
> {
>       struct mtd_part *part = PART(mtd);
>       return part->master->write_user_prot_reg (part->master, from,
>                                       len, retlen, buf);
> }
>
229,231d252
<               slave->mtd.read_user_prot_reg = master->read_user_prot_reg;
<               slave->mtd.read_fact_prot_reg = master->read_fact_prot_reg;
<               slave->mtd.write_user_prot_reg = master->write_user_prot_reg;
243a265,270
>               if(master->read_user_prot_reg)
>                       slave->mtd.read_user_prot_reg = 
part_read_user_prot_reg;
>               if(master->read_fact_prot_reg)
>                       slave->mtd.read_fact_prot_reg = 
part_read_fact_prot_reg;
>               if(master->write_user_prot_reg)
>                       slave->mtd.write_user_prot_reg = 
part_write_user_prot_reg;
