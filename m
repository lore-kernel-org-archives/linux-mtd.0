Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CsHCk-0007Eb-58
	for linux-mtd@lists.infradead.org; Sat, 22 Jan 2005 04:05:20 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41F119F8.2050500@redhat.com>
References: <41ED2EB3.1070203@redhat.com>
	<1106068748.16877.109.camel@tglx.tec.linutronix.de>
	<41ED50B7.9000107@redhat.com>
	<1106082905.16877.141.camel@tglx.tec.linutronix.de>
	<41F03217.3070300@redhat.com>
	<1106299658.5483.16.camel@tglx.tec.linutronix.de>
	<41F119F8.2050500@redhat.com>
Content-Type: text/plain
Date: Sat, 22 Jan 2005 10:05:00 +0100
Message-Id: <1106384700.9818.3.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: additional error checks for AG-AND erase/write
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-21 at 09:04 -0600, David A. Marlin wrote:
> Thomas Gleixner wrote:
> > On Thu, 2005-01-20 at 16:35 -0600, David A. Marlin wrote:
> 	:
> >>Note:  I changed a few literals to defined symbols in 'nand_base.c'. 
> >>Please let me know if you would prefer this in a separate patch (or not 
> >>at all).
> > 
> > If it's not too much work it would be nice when you can do this change
> > first.
> 
> Sure.  Would you like it as a patch, or should I just commit it?

Commit. That's why you have CVS write access :)

> >>@@ -1052,6 +1062,30 @@
> >> static int nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
> >> 			  size_t * retlen, u_char * buf, u_char * oob_buf, struct nand_oobinfo *oobsel)
> >> {
> >>+	return do_nand_read_ecc(mtd, from, len, retlen, buf, oob_buf, oobsel, 0xff);
> >>+}
> > 
> > Can you please change the call in nand_read too, so it calls
> > do_nand_read_ecc directly instead of doing the double call ?
> 
> Will do.
> 
> As I was looking over this, it occurred to me that the new name 
> (do_nand_read_ecc) will be visible external to 'nand_base.c', but the 
> function does not begin with 'nand'.  Would it be more appropriate to 
> call it 'nand_do_read_ecc'?  Just trying to be consistent.
> 

Makes sense. If you want to load your driver as a module, you also have
to export the symbol.

tglx
