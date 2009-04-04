Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq9Ve-0000zU-QT
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 17:18:29 +0000
From: David Brownell <david-b@pacbell.net>
To: Kevin Cernekee <kpc.mtd@gmail.com>,
 dwmw2@infradead.org
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Date: Sat, 4 Apr 2009 10:18:19 -0700
References: <200903260042.42091.david-b@pacbell.net>
	<1238742215.20906.99.camel@localhost.localdomain>
	<a95a62fe0904031300i82bdf42h5bc854a002e0091e@mail.gmail.com>
In-Reply-To: <a95a62fe0904031300i82bdf42h5bc854a002e0091e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200904041018.19657.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 03 April 2009, Kevin Cernekee wrote:
> @@ -413,6 +590,12 @@ done:
> 
>  static int __init init_mtd(void)
>  {
> +       mtd_class = class_create(THIS_MODULE, "mtd");
> +
> +       if (IS_ERR(mtd_class)) {
> +               pr_err("Error creating mtd class.\n");
> +               return PTR_ERR(mtd_class);
> +       }

The reason I had the class creation code in its own initcall
is to ensure that it's there even when procfs isn't.  This
init_mtd() stuff is only there if procfs is configured.

So I don't much like this part of Kevin's change ... unless
MTD becomes dependent on procfs.  If there's an issue with
CONFIG_MTD=m then there's a better fix than this.


>         if ((proc_mtd = create_proc_entry( "mtd", 0, NULL )))
>                 proc_mtd->read_proc = mtd_read_proc;
>         return 0;
> @@ -422,6 +605,7 @@ static void __exit cleanup_mtd(void)
>  {
>          if (proc_mtd)
>                 remove_proc_entry( "mtd", NULL);
> +       class_destroy(mtd_class);
>  }
> 
>  module_init(init_mtd);
