Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs96U-0004Jj-2s
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 12:48:22 +0000
Message-ID: <1446209272.6126.94.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Michal Suchanek <hramrach@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Iwo Mergler
 <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Richard Weinberger <richard@nod.at>, Andrea Scian
 <rnd4@dave-tech.it>, MTD Maling List <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?=
 "(beanhuo)" <beanhuo@micron.com>
Date: Fri, 30 Oct 2015 14:47:52 +0200
In-Reply-To: <CAOMqctRzGcm786jmh_g-jTbqOnnXRZE0=_-qs+Yy0AYSNhDr6A@mail.gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon> <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon> <1446199765.6126.63.camel@gmail.com>
 <CAOMqctRzGcm786jmh_g-jTbqOnnXRZE0=_-qs+Yy0AYSNhDr6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-10-30 at 12:49 +0100, Michal Suchanek wrote:
> Actually, since there is no guarantee that the data ever gets written
> (or error reported in case it cannot) unless you fsync() every file
> before close() any sane uncompressor, backup program, etc. will
> fsync() every file written regardless of its size. So if your home
> has
> a lot of configuration files and sources this will not be nice
> continuous stream of data in many cases.
> 
> IIRC scp(1) does not fsync() potentially resulting in large amounts
> of
> data getting silently lost. For that reason and others it should be
> renamed to iscp.

This is true. If you get more or less steady stream of incoming writes
without syncs in-between, you do not need to sync the write-buffer, you
do not need to skip pages to cover the MLC paired pages. In these
situations we do not have to end up with double writing.

If there are no writes for some time, it is good idea to sync. VFS will
write-back by timeout, UBIFS will flush write-buffer by timeout.
