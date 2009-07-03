Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMjPO-0002Ny-16
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 14:06:41 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Urs Muff <urs_muff@trimble.com>
In-Reply-To: <7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jul 2009 17:05:40 +0300
Message-Id: <1246629940.20721.219.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan Roese <sr@denx.de>, Eric Holmberg <Eric_Holmberg@trimble.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-03 at 07:33 -0600, Urs Muff wrote:
> Trimble is closed until 7/13 and Eric is already gone. 
> I'm not a flash expert at all, and only know things from passing,
> but from what I have heard, NOR flash does physical erasing quite
> different from NAND flash, by togging everything to 00, and then
> to FF.  So what you are seeing is absolutely explainable with what
> I understand.

Hmm, I'll try to google. But if this is true, I do not understand
how JFFS2 may work on NOR...

I wonder if it is possible to ask NOR to erase from the beginning,
not from the end, which should help.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
