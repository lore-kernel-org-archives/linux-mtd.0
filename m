Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTokD-0001wf-S1
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:22:26 +0000
Received: by ewy3 with SMTP id 3so1942739ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:22:23 -0700 (PDT)
Subject: Re: [PATCH 4/4] flash_info: display MEMGETINFO and MEMISLOCKED
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <BANLkTik0YrwYWFiQMZucSp83zD0cS+emgQ@mail.gmail.com>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307384537-9607-4-git-send-email-vapier@gentoo.org>
	<1307422886.11104.21.camel@localhost>
	<BANLkTik0YrwYWFiQMZucSp83zD0cS+emgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 08:18:07 +0300
Message-ID: <1307423887.11104.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 01:14 -0400, Mike Frysinger wrote:
> On Tue, Jun 7, 2011 at 01:01, Artem Bityutskiy wrote:
> > On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
> >> I found the existing flash_info output to be a little lacking, so
> >> add decoders for MEMGETINFO and MEMISLOCKED.
> >>
> >> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> >> ---
> >>  flash_info.c |   98 +++++++++++++++++++++++++++++++++++++++++++++++++++------
> >>  1 files changed, 87 insertions(+), 11 deletions(-)
> >
> > Pushed patches 1-3.
> >
> > WRT this patch - I think the sector map should be a separate option,
> > because it outputs too much for a default option.
> 
> i'm adding regioninfo(-r)/sectormap(-s) as options to mtdinfo so users
> get the extended info only when they ask for it

Region info is probably not worth a separate option - I do not believe
there are flashes with more than 2-3 of them.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
