Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Crv4w-0004Ah-R2
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 04:27:43 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41F03217.3070300@redhat.com>
References: <41ED2EB3.1070203@redhat.com>
	<1106068748.16877.109.camel@tglx.tec.linutronix.de>
	<41ED50B7.9000107@redhat.com>
	<1106082905.16877.141.camel@tglx.tec.linutronix.de>
	<41F03217.3070300@redhat.com>
Content-Type: text/plain
Date: Fri, 21 Jan 2005 10:27:38 +0100
Message-Id: <1106299658.5483.16.camel@tglx.tec.linutronix.de>
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

On Thu, 2005-01-20 at 16:35 -0600, David A. Marlin wrote:
> Attached is a patch that I think implements what you described.  Please 
> let me know if I've missed anything or gone astray in the details.

Looks good.

> Note:  I changed a few literals to defined symbols in 'nand_base.c'. 
> Please let me know if you would prefer this in a separate patch (or not 
> at all).

If it's not too much work it would be nice when you can do this change
first.

> @@ -1052,6 +1062,30 @@
>  static int nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
>  			  size_t * retlen, u_char * buf, u_char * oob_buf, struct nand_oobinfo *oobsel)
>  {
> +	return do_nand_read_ecc(mtd, from, len, retlen, buf, oob_buf, oobsel, 0xff);
> +}

Can you please change the call in nand_read too, so it calls
do_nand_read_ecc directly instead of doing the double call ?

tglx
