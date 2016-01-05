Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGVnx-0004dL-8W
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 17:53:57 +0000
Received: by mail-pf0-x22e.google.com with SMTP id 78so226336798pfw.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jan 2016 09:53:36 -0800 (PST)
Date: Tue, 5 Jan 2016 09:53:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/6] MTD: lantiq: xway: various nand fixes
Message-ID: <20160105175333.GA46565@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
 <20160104233049.GA128501@google.com> <568B71EC.2070309@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568B71EC.2070309@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 05, 2016 at 08:34:04AM +0100, John Crispin wrote:
> On 05/01/2016 00:30, Brian Norris wrote:
> > Is there a good reason this driver uses plat_nand? That seems like an
> > unnecessary abstraction layer. It'd be clearer to just refactor the
> > driver to be a proper platform driver...
> > 
> > Also, I see that there's no DT binding doc.
> > 
> > Can these things be cleaned up?
> 
> grml, i was kinda hoping this would be a no brainer. the problem is that
> i don't even have the HW so refactoring / big changes are a no go or
> would require me to find users with the HW first.

Well, I could be convinced to take patches that are a little better
documented (i.e., have a little better commit descriptions), if they
fix real issues. If you're going to add device tree properties, though,
you need a DT binding doc. And the refactoring to a platform driver
should be pretty trivial, but it's not an absolute blocking requirement,
since the driver's already in mainline.

BTW, one issue with the current driver, if you're going to add a DT
binding doc: you currently require the "gen_nand" string, like this, in
your openwrt DTS(I) files:

	nand-parts@0 {
		compatible = "gen_nand", "lantiq,nand-xway";
		...
	};

That's not an acceptable binding, and that's where refactoring the
driver would help too.

> i'll try to get this resolved for v4.6.

Brian
