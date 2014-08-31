Received: from relay5-d.mail.gandi.net ([2001:4b98:c:538::197])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOA45-0007gd-Dm
 for linux-mtd@lists.infradead.org; Sun, 31 Aug 2014 18:41:26 +0000
Date: Sun, 31 Aug 2014 11:40:50 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mtd: denali: fix include guard and license block of
 denali.h
Message-ID: <20140831184050.GA4975@thin>
References: <1409310051-25726-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140829183050.GA1532@thin> <1409407766.2664.0.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1409407766.2664.0.camel@joe-AO725>
Cc: Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-mtd@lists.infradead.org,
 apw@canonical.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 30, 2014 at 07:09:26AM -0700, Joe Perches wrote:
> On Fri, 2014-08-29 at 11:30 -0700, Josh Triplett wrote:
> > (Side note: could we get checkpatch to complain about comment headers
> > containing the name of the file they appear in?  They're always either
> > redundant or wrong.)
> 
> Sure, if you can write a regex to determine an
> incorrect filename.

I was thinking more about matching the current filename, which seems
quite easy.

- Josh Triplett
