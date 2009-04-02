Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=pophost.sonytel.be)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLmw-0001fL-TE
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 12:13:01 +0000
Date: Thu, 2 Apr 2009 14:12:53 +0200 (CEST)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: Problem in cloning mtd git
In-Reply-To: <ce9ab5790904020503h41c4e8e1t2067654b6d4a6194@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.0904021411520.17667@vixen.sonytel.be>
References: <ce9ab5790904020439j7a23e93eu3f73bd26cdc4f9d4@mail.gmail.com>
	<alpine.LRH.2.00.0904021351080.17667@vixen.sonytel.be>
	<ce9ab5790904020503h41c4e8e1t2067654b6d4a6194@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2 Apr 2009, vimal singh wrote:
> >> $ git clone --reference linux-2.6 git://git.infradead.org/mtd-2.6.git mtd-2.6
> >> warning: templates not found /home_lbp/share/git-core/templates/
> >> Initialized empty Git repository in /home2/vimal/mtd-2.6/.git/
> >> fatal: Unable to look up git.infradead.org (port 9418) (Temporary
> >> failure in name resolution)
> >> fetch-pack from 'git://git.infradead.org/mtd-2.6.git' failed.
> >>
> >> Any help regarding this is welcome...
> >
> > Alternatively, you can add the MTD stuff as a remote to your existing
> > repository:
> >
> > % cd linux-2.6
> > % git remote add mtd git://git.infradead.org/mtd-2.6.git
> > % git remote update
> >
> I tried this right now and I see this:
> >From http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6
>    15f7176..833bb30  master     -> origin/master
> Updating mtd
> fatal: Unable to look up git.infradead.org (port 9418) (Temporary
> failure in name resolution)

Local DNS problem?  Try 18.85.46.34 instead of git.infradead.org.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
