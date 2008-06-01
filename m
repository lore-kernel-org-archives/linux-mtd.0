Received: from mx1.riseup.net ([204.13.164.18])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K2fop-0006KJ-In
	for linux-mtd@lists.infradead.org; Sun, 01 Jun 2008 05:09:24 +0000
Date: Sun, 1 Jun 2008 07:09:12 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [patch 1/2] MTD: use list_for_each_entry() in add_mtd_device()
Message-ID: <20080601050912.GC8734@traven>
References: <20080531132808.644758754@kaehlcke.net>
	<20080531132808.984625508@kaehlcke.net>
	<20080531133511.GA8734@traven> <20080531194154.GA7055@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080531194154.GA7055@logfs.org>
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org,
	Chris Malley <mail@chrismalley.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

El Sat, May 31, 2008 at 09:41:55PM +0200 Jörn Engel ha dit:

> On Sat, 31 May 2008 15:35:11 +0200, Matthias Kaehlcke wrote:
> > 
> > MTD: use list_for_each_entry() instead of list_for_each() in add_mtd_device()
> > 
> > Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> 
> Chris Malley (added to Cc:) sent a patch converting all of drivers/mtd/
> in a similar fashion.  It should be on its way in, if dwmw2 hasn't
> missed it.

fine :)
 
> You might also want to check your mailer.  This patch looks like bouquet
> of flowers that got stuck in an elevator door. ;)

thanks for the pointer. normally my mutt/emacs config doesn't cause
this type of problems, i suppose i screwed it up myself somehow ...

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

    The book of nature is written in the language of mathematics
                         (Galileo Galilei)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
