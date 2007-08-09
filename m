Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIxsm-0001TG-GG
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 22:36:17 -0400
Date: Thu, 9 Aug 2007 04:32:17 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Christoph Hellwig <hch@infradead.org>, J??rn Engel <joern@logfs.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, akpm@osdl.org,
	David Woodhouse <dwmw2@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Patch 18/18] include/linux/Kbuild
Message-ID: <20070809023217.GA3321@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
	<20070808162447.GT15319@lazybastard.org>
	<20070809001913.GA10044@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070809001913.GA10044@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 9 August 2007 01:19:13 +0100, Christoph Hellwig wrote:
> On Wed, Aug 08, 2007 at 06:24:47PM +0200, J??rn Engel wrote:
> > --- linux-2.6.21logfs/include/linux/Kbuild~logfs	2007-08-08 02:57:37.000000000 +0200
> > +++ linux-2.6.21logfs/include/linux/Kbuild	2007-08-08 02:57:37.000000000 +0200
> > @@ -101,6 +101,7 @@ header-y += jffs2.h
> >  header-y += keyctl.h
> >  header-y += limits.h
> >  header-y += lock_dlm_plock.h
> > +header-y += logfs.h
> 
> That file doesn't define any kind of user<->kernel interface and thus should
> not be exported.

mklogfs needs the header.  Does that not qualify?


Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
