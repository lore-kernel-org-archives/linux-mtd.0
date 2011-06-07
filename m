Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QToXe-0001lv-HK
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:09:27 +0000
Received: by eyh6 with SMTP id 6so1939926eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:09:25 -0700 (PDT)
Subject: Re: [PATCH 4/4] flash_info: display MEMGETINFO and MEMISLOCKED
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307422886.11104.21.camel@localhost>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307384537-9607-4-git-send-email-vapier@gentoo.org>
	<1307422886.11104.21.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 08:05:08 +0300
Message-ID: <1307423108.11104.24.camel@localhost>
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

On Tue, 2011-06-07 at 08:01 +0300, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
> > I found the existing flash_info output to be a little lacking, so
> > add decoders for MEMGETINFO and MEMISLOCKED.
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > ---
> >  flash_info.c |   98 +++++++++++++++++++++++++++++++++++++++++++++++++++------
> >  1 files changed, 87 insertions(+), 11 deletions(-)
> 
> Pushed patches 1-3.
> 
> WRT this patch - I think the sector map should be a separate option,
> because it outputs too much for a default option.

Hmm, actually, for this utility it is probably ok this way.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
