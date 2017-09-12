Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drmW5-0007vE-T1
 for linux-mtd@lists.infradead.org; Tue, 12 Sep 2017 14:50:23 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 kernel@pengutronix.de, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 linux-ima-devel@lists.sourceforge.net
Subject: Re: [PATCH] fs: ubifs: Add i_version support
Date: Tue, 12 Sep 2017 16:50:13 +0200
Message-ID: <1996861.9Gom84rckB@blindfold>
In-Reply-To: <20170912142318.4x3qg6chohykobb6@pengutronix.de>
References: <20170912103900.8629-1-s.hauer@pengutronix.de>
 <6751565.egDpcXuPTN@blindfold>
 <20170912142318.4x3qg6chohykobb6@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha,

Am Dienstag, 12. September 2017, 16:23:18 CEST schrieb Sascha Hauer:
> > So, for the IMA use-case we don't even have to persist i_version.
> > That would be cool.
> 
> Yes, that's what earlier versions of this patch did, nacked by Christoph
> 
> Hellwig with the words:
> > Maybe IMA doesn't care, but if you set MS_I_VERSION the fs does give
> > a guarantee.  Sp NAK on this patch as-is.
> 
> (see https://lkml.org/lkml/2017/4/12/61)
> 
> Reading this sentence again it may be a possibility to just increase the
> i_version field without setting the MS_I_VERSION flag.

Yes.

> > I need to read what other filesystems do, it is still not completely clear
> > to me what the expected i_version semantics are. Satisfying IMA seems to
> > be easy but we need to be very sure to not break other futuer i_version
> > users...
> Sure. I am also not sure whether I implemented it correctly since it's
> implementation defined by some filesystem drivers which I am afraid are
> not even consistent.

As usual, let's try to keep at least UBIFS kind of sane. ;-)

Thanks,
//richard
