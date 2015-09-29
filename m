Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgivV-0004MK-TF
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 00:37:50 +0000
Received: by pacfv12 with SMTP id fv12so192495890pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 17:37:29 -0700 (PDT)
Date: Mon, 28 Sep 2015 17:37:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Destroy mtd_idr on module_exit
Message-ID: <20150929003726.GT31505@google.com>
References: <1436368534-30687-1-git-send-email-jthumshirn@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436368534-30687-1-git-send-email-jthumshirn@suse.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 08, 2015 at 05:15:34PM +0200, Johannes Thumshirn wrote:
> Destroy mtd_idr on module_exit, reclaiming the allocated memory.
> 
> This was detected by the following semantic patch (written by Luis Rodriguez
> <mcgrof@suse.com>)
> <SmPL>
> @ defines_module_init @
> declarer name module_init, module_exit;
> declarer name DEFINE_IDR;
> identifier init;
> @@
> 
> module_init(init);
> 
> @ defines_module_exit @
> identifier exit;
> @@
> 
> module_exit(exit);
> 
> @ declares_idr depends on defines_module_init && defines_module_exit @
> identifier idr;
> @@
> 
> DEFINE_IDR(idr);
> 
> @ on_exit_calls_destroy depends on declares_idr && defines_module_exit @
> identifier declares_idr.idr, defines_module_exit.exit;
> @@
> 
> exit(void)
> {
>  ...
>   idr_destroy(&idr);
>   ...
> }
> 
> @ missing_module_idr_destroy depends on declares_idr && defines_module_exit && !on_exit_calls_destroy @
> identifier declares_idr.idr, defines_module_exit.exit;
> @@
> 
> exit(void)
> {
>  ...
>  +idr_destroy(&idr);
> }
> </SmPL>
> 
> Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>

Applied to l2-mtd.git. Thanks.
