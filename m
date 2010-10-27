Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PB2Ht-0000Hn-Dd
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2010 09:27:18 +0000
Received: by fxm15 with SMTP id 15so521028fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2010 02:27:15 -0700 (PDT)
Subject: Re: UBIFS: mount based on UUID?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <AANLkTikc8fpTtTUXs2KaF3h4Bd6TH6kjPr_F3pN=e5u=@mail.gmail.com>
References: <20101026055332.B14FD152451@gemini.denx.de>
	<1288083795.2227.28.camel@localhost>
	<20101026162900.423EC1365D8@gemini.denx.de>
	<AANLkTikc8fpTtTUXs2KaF3h4Bd6TH6kjPr_F3pN=e5u=@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Oct 2010 10:57:47 +0300
Message-ID: <1288166267.2195.0.camel@localhost>
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

On Wed, 2010-10-27 at 14:34 +0900, Kyungmin Park wrote:
> On Wed, Oct 27, 2010 at 1:29 AM, Wolfgang Denk <wd@denx.de> wrote:
> > Dear Artem,
> >
> > In message <1288083795.2227.28.camel@localhost> you wrote:
> >>
> >> No, you are right, we do have UUID, but we added it just in case we need
> >> it in the future, e.g., for NFS support, but we do not use it currently
> >> because we did not need it. And we did not look at mounting by UUID - it
> >> should be possible to do.
> >
> > I see.
> >
> >> I'm a bit overloaded at the moment, but if I have time later, I can look
> >> at it.
> 
> Hi Artem,
> I'm also waiting this feature. now it used for script for parsing
> mount ubifs. but if support UUID, I will use this one.

I see. But there is always an option to just do it and submit a patch,
do not forget about this :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
