Received: from moutng.kundenserver.de ([212.227.126.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MA3bV-0005dv-N8
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 15:02:48 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/4] [MTD] compat_ioctl cleanup
Date: Fri, 29 May 2009 16:02:36 +0100
References: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
	<1243609086.19886.179.camel@macbook.infradead.org>
In-Reply-To: <1243609086.19886.179.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200905291602.37190.arnd@arndb.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 29 May 2009, David Woodhouse wrote:
> On Wed, 2009-04-08 at 22:53 -0700, Kevin Cernekee wrote:
> > 
> > +static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
> > +       unsigned long arg)
> > +{
> > +       struct mtd_file_info *mfi = file->private_data;
> > +       struct mtd_info *mtd = mfi->mtd;
> > +       void __user *argp = (void __user *)arg;
> 
> Shouldn't that be 'argp = compat_ptr(arg)' ?

Yes, that's right. I missed this when I looked at the patches.

	Arnd <><
