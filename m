Received: from smtprelay0235.hostedemail.com ([216.40.44.235]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abEM7-00059o-OW
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 21:30:52 +0000
Message-ID: <1456954226.4044.47.camel@perches.com>
Subject: Re: [PATCH V2] ubifs: Add logging functions for ubifs_msg,
 ubifs_err and ubifs_warn
From: Joe Perches <joe@perches.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Adrian
 Hunter <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
Date: Wed, 02 Mar 2016 13:30:26 -0800
In-Reply-To: <56D75A1F.5070304@nod.at>
References: <1456944509.4044.27.camel@nod.at>
 <1456945122.4044.35.camel@perches.com> <56D75A1F.5070304@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-03-02 at 22:24 +0100, Richard Weinberger wrote:
> Am 02.03.2016 um 19:58 schrieb Joe Perches:
[]
> > For drivers/mtd/ubi, Artem is also a nominal maintainer, but
> > last signed a patch in 2014.
> > 
> > Likely the MAINTAINERS entry for UBI should be updated too.
> > 
> > Maybe something like:
[]
> > diff --git a/MAINTAINERS b/MAINTAINERS
[]
> > @@ -11266,8 +11266,7 @@ S:	Maintained
> >  F:	drivers/scsi/u14-34f.c
> >  
> >  UBI FILE SYSTEM (UBIFS)
> > -M:	Artem Bityutskiy <dedekind1@gmail.com>
> > -M:	Adrian Hunter <adrian.hunter@intel.com>
> > +M:	Richard Weinberger <richard@nod.at>

> I can be the official patch monkey for UBIFS.
> Especial as the git tree is the same as for UBI.
> 
> But I definitely want to keep Artem.
> He gives very valuable input and knows UBIFS much better than I do.

That's fine and it's your (and his) choice what do to.

> >  L:	linux-mtd@lists.infradead.org
> >  T:	git git://git.infradead.org/ubifs-2.6.git
> >  W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
> > @@ -11350,7 +11349,6 @@ F:	Documentation/scsi/ufs.txt
> >  F:	drivers/scsi/ufs/
> >  
> >  UNSORTED BLOCK IMAGES (UBI)
> > -M:	Artem Bityutskiy <dedekind1@gmail.com>
> >  M:	Richard Weinberger <richard@nod.at>
> >  W:	http://www.linux-mtd.infradead.org/
> >  L:	linux-mtd@lists.infradead.org
> Same here. Artem has to stay.

Perhaps an "R:" (reviewer) entry is appropriate for Artem.
