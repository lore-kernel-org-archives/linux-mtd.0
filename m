Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QToEn-0001b6-TO
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:49:58 +0000
Received: by ewy3 with SMTP id 3so1936239ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:49:55 -0700 (PDT)
Subject: Re: [PATCH 1/4] flash_info: convert to common.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307421760.11104.16.camel@localhost>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307421064.11104.7.camel@localhost>
	<BANLkTimBGH0UW-YP=CZ7aDf_-nXXDhfz4Q@mail.gmail.com>
	<1307421760.11104.16.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 07:45:38 +0300
Message-ID: <1307421938.11104.17.camel@localhost>
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

On Tue, 2011-06-07 at 07:42 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 00:41 -0400, Mike Frysinger wrote:
> > On Tue, Jun 7, 2011 at 00:31, Artem Bityutskiy wrote:
> > > On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
> > >> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > >> ---
> > >>  flash_info.c |   27 +++++++++++++++++----------
> > >>  1 files changed, 17 insertions(+), 10 deletions(-)
> > >
> > > How about killing this utility completely and use mtdinfo from ubi-utils
> > > instead? Yes, before creating mtdinfo I should have noticed flash_info,
> > > but I did not. Did you look at mtdinfo?
> > 
> > didnt even notice it :P
> > 
> > if mtdinfo provides all the details that my new flash_info does, then
> > i dont care about punting it.  be nice to merge my fixes before
> > deleting it though, otherwise i feel like i wasted quite a bit of time
> > for nothing ;).
> 
> I think it provides everything except of region information, which
> flash_info provides :)

And it does not show a map of sectors. May be we can add this to mtdinfo
instead?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
