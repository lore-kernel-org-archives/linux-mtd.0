Received: from nz-out-0506.google.com ([64.233.162.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGxgG-0005yP-Fg
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 09:59:05 -0400
Received: by nz-out-0506.google.com with SMTP id z3so304378nzf
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 06:59:03 -0700 (PDT)
Message-ID: <625fc13d0708030659m7379e8rfd0f777844b57a10@mail.gmail.com>
Date: Fri, 3 Aug 2007 08:59:02 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
Subject: Re: mkfs.jffs2 version broken
In-Reply-To: <20070802081323.10e07fcd@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8871.69.30.123.186.1185394199.squirrel@architechnical.net>
	<20070802081323.10e07fcd@weaponx.rchland.ibm.com>
Cc: Pete MacKay <linux@architechnical.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/2/07, Josh Boyer <jwboyer@linux.vnet.ibm.com> wrote:
> On Wed, 25 Jul 2007 13:09:59 -0700 (PDT)
> "Pete MacKay" <linux@architechnical.net> wrote:
>
> > Paul Wakeman raised a valid issue in his XATTR email about the version
> > number reported in mkfs.jffs2.  We have two versions, both with
> > different behaviors and even option lists / help screens, and they
> > both report as version 1.50.  I pulled from the git last week and
> > this was still the case.
> >
> > Could someone who has access or responsibility for that code please
> > update it or replace it with a date?  (It caused us hours of
> > debugging and broke our build).
>
> Sure, I'll look at that soon.

I incremented the version number in the git tree this morning.

josh
