Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAr2l-0000Vd-Jc
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 09:59:44 -0500
Date: Mon, 14 Mar 2005 15:59:48 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050314145948.GB17977@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0503121217090.24583@localhost.localdomain>
	<20050314141509.GA17590@wohnheim.fh-wedel.de>
	<4235A298.50908@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4235A298.50908@yandex.ru>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: how to access jffs2 partition properties?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 March 2005 17:41:28 +0300, Artem B. Bityuckiy wrote:
> 
> >Not all mtd are flash based.  Mtd code should have zero knowledge
> >about chip, start address, etc.  If you need that information, you
> >have to tweak the mapping driver to give it out.
> 
> May be /proc/mtd is what you are looking for ?

Nope.  mphysmap (the old version from several years ago) created its
own proc file.  That one, in combination with /proc/mtd would contain
the necessary information.

New mphysmap is missing the proc file.  And the person that requested
the driver has been silent for a while, so I have no idea if it even
works.  Lack of hardware.

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
