Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSVSC-0007Lv-64
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 14:34:24 +0000
Received: by eyh6 with SMTP id 6so869478eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 07:34:22 -0700 (PDT)
Subject: Re: [PATCH 05/10] UBIFS: fix shrinker object count reports
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1307108926.3069.0.camel@localhost>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
	<1307109001-19761-6-git-send-email-dedekind1@gmail.com>
	<1307108926.3069.0.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 17:30:13 +0300
Message-ID: <1307111413.3069.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 16:48 +0300, Artem Bityutskiy wrote:
> On Fri, 2011-06-03 at 16:49 +0300, Artem Bityutskiy wrote:
> > +		/*
> > +		 * Due to the way UBIFS updates the clean znode counter it may
> > +		 * temporarily be negative.
> > +		 */
> > +		return clean_zn_cnt > 0 ?: 1;
> 
> Oh, this should be  clean_zn_cnt >= 0 ?: 1;

Crap, sorry, stupid me :-)

return clean_zn_cnt < 0 ?: clean_zn_cnt;

But yeah, it is saner to not use "?:" at all:

return clean_zn_cnt >= 0 ? clean_zn_cnt: 1;

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
