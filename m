Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaOnl-0000SH-P2
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 08:33:02 +0000
Received: by fxm19 with SMTP id 19so14151110fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 00:33:00 -0800 (PST)
Subject: RE: UBIFS reboots issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Boaz Ben-David <boaz.bd@wellsense-tech.com>
In-Reply-To: <39A4B204C321D34DA3490E3B119D5A6C68BF776758@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
	<1293049245.2051.4.camel@koala>
	<39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>
	,
	<EF949E0CEB6551499A3643069FE41ACB034B6DFC@CNSHGSMBS01.ad4.ad.alcatel.com>
	<39A4B204C321D34DA3490E3B119D5A6C68BF77573E@SBS2008.wellsense.local>
	<39A4B204C321D34DA3490E3B119D5A6C68BF776758@SBS2008.wellsense.local>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 10:32:57 +0200
Message-ID: <1294216377.2179.9.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-12-28 at 17:47 +0200, Boaz Ben-David wrote:
> I'm sorry for changing the thread subject in the previous mail..
> 
> I guess it sums up to one main question (and I would be very greatful if
> someone could answer):
> 
> 	Overall, for use on MLC NAND, is UBIFS or JFFS2 more suitable?

None, because no one with clue analyzed them WRT MLC-specific aspects.
And no-one seriously stress-tested them on MLC, at least no-one sent any
public report about this. UBIFS may appear to work, but then fail
horribly when you have an unclean power cut.

So again, you cannot use UBIFS as-is on MLC and sleep well. You need to
spend time and test/analyze them.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
