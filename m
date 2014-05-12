Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjrGG-0005Db-8a
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 14:31:25 +0000
Date: Mon, 12 May 2014 16:30:59 +0200
From: Luka Perkov <luka@openwrt.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: add a ubi forced detach ioctl
Message-ID: <20140512143059.GA32013@w500.lan>
References: <1399850250-24616-1-git-send-email-luka@openwrt.org>
 <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>
 <53709292.6070600@phrozen.org> <20140512104400.GA24995@w500.lan>
 <5370D0E5.4040800@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5370D0E5.4040800@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 John Crispin <blogic@openwrt.org>, John Crispin <john@phrozen.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 12, 2014 at 03:47:17PM +0200, Richard Weinberger wrote:
> Am 12.05.2014 12:44, schrieb Luka Perkov:
> > On Mon, May 12, 2014 at 11:21:22AM +0200, John Crispin wrote:
> >> This is a ugly temporary patch that we carry around in openwrt until we
> >> have a real fix. why are you trying to upstream this ?
> > 
> > I didn't think this is a hack, other file systems can force umount as
> > well. What are you proposing as a real fix?
> 
> You're messing with UBI, not UBIFS. :-)

True.

> So, what problem is your patch solving and why do we need it upstream?

You can drop it. Thanks!

Luka
