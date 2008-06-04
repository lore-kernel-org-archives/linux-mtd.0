Received: from mx1.riseup.net ([204.13.164.18])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3w07-0005pI-QZ
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 16:38:16 +0000
Date: Wed, 4 Jun 2008 18:38:06 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 1/2] MTD: use list_for_each_entry() in add_mtd_device()
Message-ID: <20080604163806.GA28628@traven>
References: <20080531132808.644758754@kaehlcke.net>
	<20080531132808.984625508@kaehlcke.net>
	<1212597248.32207.126.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1212597248.32207.126.camel@pmac.infradead.org>
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

El Wed, Jun 04, 2008 at 05:34:08PM +0100 David Woodhouse ha dit:

> On Sat, 2008-05-31 at 15:28 +0200, matthias@kaehlcke.net wrote:
> > -                       struct list_head *this;
> > +                       struct mtd_notifier *not
> 
> That's not even going to compile, surely?

i forgot to tell quilt to refresh the patch before sending it. i sent
a fix just some minutes after the broken patch

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

     La libertad es como la mañana. Hay quienes esperan dormidos a que
   llegue, pero hay quienes desvelan y caminan la noche para alcanzarla
                        (Subcomandante Marcos)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
