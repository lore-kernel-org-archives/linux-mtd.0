Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBlWd-0007cr-OH
	for linux-mtd@lists.infradead.org; Wed, 03 Jun 2009 08:08:51 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stefan Roese <sr@denx.de>
In-Reply-To: <200905150916.54091.sr@denx.de>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 03 Jun 2009 11:08:30 +0300
Message-Id: <1244016510.5847.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>,
	Eric Holmberg <Eric_Holmberg@trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>, Urs Muff <urs_muff@trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-15 at 09:16 +0200, Stefan Roese wrote:
> Do you have an update for this? What's the current status on your system now? 
> Which patches did you apply to work reliably with the Spansion FLASH?
> 
> I'm asking since we are seeing a similar issue on one of our boards equipped 
> with the S29GL512P. This simple script triggers problems upon the next mount:

FYI. Since this issue has not been resolved due to lack of information,
I've updated UBIFS FAQ and put a note about this issue there:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_powercut

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
