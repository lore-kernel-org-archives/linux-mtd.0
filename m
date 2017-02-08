Received: from mail-it0-f66.google.com ([209.85.214.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbZcz-0000lu-Af
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 21:18:15 +0000
Received: by mail-it0-f66.google.com with SMTP id o185so268907itb.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 13:17:52 -0800 (PST)
Date: Wed, 8 Feb 2017 13:16:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
Message-ID: <20170208211649.GE94627@google.com>
References: <20170203094946.2112158-1-arnd@arndb.de>
 <0e6b1dc1-5311-91ba-10e3-1a13f866df6b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e6b1dc1-5311-91ba-10e3-1a13f866df6b@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 04, 2017 at 10:12:35PM +0100, Marek Vasut wrote:
> On 02/03/2017 10:49 AM, Arnd Bergmann wrote:
> > kernelci.org reports a warning for this driver, as it copies a local
> > variable into a 'const char *' string:
> > 
> >     drivers/mtd/maps/pmcmsp-flash.c:149:30: warning: passing argument 1 of 'strncpy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> > 
> > Using kstrndup() simplifies the code and avoids the warning.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>

Applied to l2-mtd.git.
