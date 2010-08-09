Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiO6I-0003zl-Ry
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 08:52:55 +0000
Subject: Re: [PATCH] Add quick erase format option
From: Stefani Seibold <stefani@seibold.net>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1281343038.12908.25.camel@localhost>
References: <1281342353-18180-1-git-send-email-stefani@seibold.net>
	<1281343038.12908.25.camel@localhost>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Mon, 09 Aug 2010 10:52:54 +0200
Message-ID: <1281343974.18398.13.camel@wall-e.seibold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, den 09.08.2010, 09:37 +0100 schrieb David Woodhouse:
> On Mon, 2010-08-09 at 09:25 +0100, stefani@seibold.net wrote:
> > From: Stefani Seibold <stefani@seibold.net>
> > 
> > This patch add a quick format option which skips erasing of already erased
> > flash blocks. This is useful for first time production environments where
> > the flash arrived erased.
> > 
> > Signed-off-by: Stefani Seibold <stefani@seibold.net> 
> 
> This scares me, given the lengths we had to go to in JFFS2 to cope with
> blocks which *look* like they're erased, but which actually start losing
> data as soon as you start writing to them because the erase didn't
> complete.
> 

I know the drawback. This is why it is only an option which must be
enabled. And in most use cases there is a subsequent ubimkvol, which
will fail if the flash is not correct initialized.

Flash are normally delivered erased. So this save in our production
environment (Nokia Siemens Networks) about 5 minutes per device (256 MB
NOR CFI Flash).

The old JFFS2 was very fast to install the first time on a flash, it was
only a simple mount of the MTD partition. 

Which the quick format option i have now only a slightly first time
installation overhead compared to JFFS2. Without this option the
overhead is more than 5 minutes.

- Stefani
