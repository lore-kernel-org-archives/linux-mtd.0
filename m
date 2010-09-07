Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ot2HS-0004N4-PI
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 17:48:30 +0000
Received: by bwz13 with SMTP id 13so5731284bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 10:48:25 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1283879856.2029.6.camel@brekeke>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
	<AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
	<AANLkTinHmSpucwL4nKc5RNaBVc6fdt7bT_hTd2-fkQhB@mail.gmail.com>
	<1283367468.2209.33.camel@brekeke>
	<1283764656.11066.22.camel@localhost>
	<AANLkTi=LT+rigRKrUkwF202mqvJCA7L0DG4WTYqBzCLE@mail.gmail.com>
	<1283879856.2029.6.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 20:48:22 +0300
Message-ID: <1283881702.2029.8.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: JamesLNute@eaton.com, linux-mtd@lists.infradead.org,
	Adrian.Hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-07 at 20:17 +0300, Artem Bityutskiy wrote:
> > I'll probably have time to set this test up in the next few days, but
> > it may be weeks until the test device goes bad (if it ever goes bad at
> > all).  As far as what code should be tested, do you want me to just
> > pull a copy of the latest ubifs-2.6 tree?
> 
> This is probably not so important. Use the ubifs you have, but I'd like
> to also see it. And send the debugging patch to me for reveiw to
> comments (you'll need to prepare).

Err, I also think you should try my UBI patches which may help. But they
may themselves have a bug. May be 2 setups - one with one of your trees
and the other is latest ubifs + those patches?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
