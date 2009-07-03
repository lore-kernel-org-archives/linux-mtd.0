Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMkEH-0004Wl-4r
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 14:59:16 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Urs Muff <urs_muff@trimble.com>
In-Reply-To: <7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
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
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jul 2009 17:58:51 +0300
Message-Id: <1246633131.20721.224.camel@localhost.localdomain>
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

On Fri, 2009-07-03 at 08:47 -0600, Urs Muff wrote:
> I can't find the data-sheet reference to that, but I would not characterize it as 'erasing from the end'.
> 
> As far as I understand it is a 2 phase process, and you can lose power at any point so you can see a partial phase I or a partial phase II state.
> - phase I: set all data to 00: a partial picture would be to see 00 at the beginning and random at the end of the block
> - phase II: set all data to FF: a partial picture would be to see FF at the beginning and 00 at the end of the block

That would be nice, because then UBI would work fine, since it would
notice corrupted EC header at the beginning, and would drop the PEB.

> From looking at your dumps, it appears that you got interrupted during
> phase II.  I'm not sure why you still have the header, but that might
> be b/c the block has been reclaimed / reinitialized (I'm not familiar
> with the actual code, but it appears that way from the dump).

No, I believe it was not reinitialized.

But I should write a small test program which writes a known pattern to
PEBs, then erases them, and sees what happened to them after an unclean
reboot.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
