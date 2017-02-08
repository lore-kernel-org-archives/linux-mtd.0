Received: from mail-pf0-f194.google.com ([209.85.192.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbaZJ-0006Zy-9o
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 22:18:31 +0000
Received: by mail-pf0-f194.google.com with SMTP id 19so12291680pfo.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 14:18:08 -0800 (PST)
Date: Wed, 8 Feb 2017 14:17:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ichxrom: maybe-uninitialized with gcc-4.9
Message-ID: <20170208221705.GH94627@google.com>
References: <20161024152853.2673518-1-arnd@arndb.de>
 <470c5483-949c-6e2a-cd52-73d99748b312@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <470c5483-949c-6e2a-cd52-73d99748b312@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 24, 2016 at 10:47:59PM +0200, Marek Vasut wrote:
> On 10/24/2016 05:28 PM, Arnd Bergmann wrote:
> > pci_read_config_word() might fail and not initialize its output,
> > as pointed out by older versions of gcc when using the -Wmaybe-unintialized
> > flag:
> > 
> > drivers/mtd/maps/ichxrom.c: In function ‘ichxrom_cleanup’:
> > drivers/mtd/maps/ichxrom.c:63:2: error: ‘word’ is used uninitialized in this function [-Werror=uninitialized]
> > 
> > This is apparently a correct warning, though it does not show up
> > with newer compilers. Changing the code to not attempt to write
> > back uninitialized data into PCI config space is a correct
> > fix for the problem and avoids the warning.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied to l2-mtd.git
