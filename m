Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov2UH-0004em-J3
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 06:26:01 +0000
Received: by bwz13 with SMTP id 13so5534729bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 23:25:55 -0700 (PDT)
Subject: Re: [PATCH 2/2] nanddump: add --nobad to read bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20100913062209.GA7382@pengutronix.de>
References: <1284263427-31342-2-git-send-email-vapier@gentoo.org>
	<70E876B0EA86DD4BAF101844BC814DFE0903E3E3DC@Cloud.RL.local>
	<20100913062209.GA7382@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Sep 2010 09:24:30 +0300
Message-ID: <1284359070.27765.155.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>, Jon Povey <Jon.Povey@racelogic.co.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-13 at 08:22 +0200, Wolfram Sang wrote:
> On Mon, Sep 13, 2010 at 06:50:04AM +0100, Jon Povey wrote:
> > Mike Frysinger wrote:
> > > Sometimes dumping bad blocks is useful, like when the data isn't actually
> > > bad but the OOB layout isn't what the kernel is expecting or is otherwise
> > > screwed up.  The --nobad option allows just that.
> > 
> > > +"-N         --nobad              Read without bad block skipping\n"
> > 
> > This doesn't seem like a good name for the option to me. A useful option but
> > an unintuitive name, "nobad" sounds like it is going to omit bad blocks,
> > where actually it is going to include them.
> > 
> > "noskipbad" or "includebad" would seem to be better.
> 
> I agree. Is that still fixable despite being pushed already?

Sure, send a patch please.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
