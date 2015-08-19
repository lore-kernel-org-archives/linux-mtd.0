Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrJ4-0001j1-66
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:32:42 +0000
Received: by pabyb7 with SMTP id yb7so143801139pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:32:21 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:32:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: denali: Use module_pci_driver
Message-ID: <20150819003217.GQ60523@google.com>
References: <20150707072345.GA20060@vaishali-Ideapad-Z570>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150707072345.GA20060@vaishali-Ideapad-Z570>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 07, 2015 at 12:53:45PM +0530, Vaishali Thakkar wrote:
> Use module_pci_driver for drivers whose init and exit functions
> only register and unregister, respectively.
> 
> A simplified version of the Coccinelle semantic patch that performs
> this transformation is as follows:
> 
> @a@
> identifier f, x;
> @@
> -static f(...) { return pci_register_driver(&x); }
> 
> @b depends on a@
> identifier e, a.x;
> @@
> -static e(...) { pci_unregister_driver(&x); }
> 
> @c depends on a && b@
> identifier a.f;
> declarer name module_init;
> @@
> -module_init(f);
> 
> @d depends on a && b && c@
> identifier b.e, a.x;
> declarer name module_exit;
> declarer name module_pci_driver;
> @@
> -module_exit(e);
> +module_pci_driver(x);
> 
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>

It seems I got 3 independent versions of the same patch... I pushed the
most recent one, then noticed this one. Thanks anyway.

Brian
