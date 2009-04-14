Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ltkxb-0004cJ-7x
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 15:54:13 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <1239723924.3390.136.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305BEFB@usw-am-xch-02.am.trimblecorp.net>
	<1239723924.3390.136.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Apr 2009 18:53:58 +0300
Message-Id: <1239724438.3390.138.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-14 at 18:45 +0300, Artem Bityutskiy wrote:
> > Corruption occurred after approximately 2 hours of operation
> > (approximately 130 power cycles).
> > 
> > [42949375.790000] UBIFS error (pid 1): ubifs_read_node: bad node type
> > (11 but expected 6)
> > [42949375.800000] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
> > 0:0
> 
> How about enabling debugging (no debugging messages, just debugging).
> See
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
> item 3

Note, not "extra checks" as well. Just debugging. It will add some
light-weight assertions plus verbose error reporting which include
dumps, etc.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
