Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTXKN-0001zl-F2
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 08:37:37 +0000
Subject: Re: UBI FS mounting time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <1248251435.24676.42.camel@localhost>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
	<4A66B547.6020207@nokia.com>
	<71cd59b00907220012pe8200e6od143f2561501bd0f@mail.gmail.com>
	<4A66C209.7060305@nokia.com>
	<71cd59b00907220057s6dbbdcb0vc23526836939aa97@mail.gmail.com>
	<4A66CA03.5000406@nokia.com>  <1248251435.24676.42.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Jul 2009 11:36:48 +0300
Message-Id: <1248251808.24676.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Bosi Daniele <Daniele.Bosi@mta.it>,
	Corentin Chary <corentin.chary@gmail.com>,
	Brijesh Singh <brij.singh@samsung.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-22 at 11:30 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-07-22 at 11:12 +0300, Adrian Hunter wrote:
> > I would fix the anchor block in the first good PEB and use just one.
> > If you lose power while erasing the anchor then you have to scan,
> > but you have to scan anyway if you lose power, so there is not much
> > difference.
> 
> But if you go this far, an implement the anchor things, then it makes
> much more sense to implement your UBI2 ides, instead of this crippled
> "dump everything to flash on unmount" stuff. Your idea of a journal
> is much saner. Remember you suggested it to Samsung people as a way to
> fix mount time problems, but not memory consumption issuse, which are
> not that bad, and then you said we can create UBI3 to fix memory issues.

BTW, you did not nicely describe it in the ML. If you can do this, I'll
put this information to the MTD web site, I think it is useful because
that sounded as a good plan.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
