Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0w37-0001WI-7a
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 12:46:17 +0000
Received: by fxm15 with SMTP id 15so503418fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 05:46:16 -0700 (PDT)
Subject: Re: pwrite() to nand in raw mode fails with EINVAL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: mbizon@freebox.fr
In-Reply-To: <1285699650.32420.70.camel@sakura.staff.proxad.net>
References: <1285699650.32420.70.camel@sakura.staff.proxad.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 15:44:14 +0300
Message-ID: <1285764254.2437.113.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>, David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-28 at 20:47 +0200, Maxime Bizon wrote:
> Hi,
> 
> Since commit 782ce79a45b3b850b108896fcf7da26754061c8f ("cleanup the
> nand_do_write_ops"), a pwrite() to a NAND device fails with EINVAL.
> 
> The EINVAL comes from here:
> 
>         /* Don't allow multipage oob writes with offset */
>         if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
>                 return -EINVAL;
> 
> 
> ops->ooboffs seems uninitialized.
> 
> 
> I think the following memset() are missing:

This looks like a regression fix and this also needs to be sent to
stable, right?


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
