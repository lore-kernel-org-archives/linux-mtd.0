Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6KXW-0005Y4-13
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 08:19:46 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 May 2009 11:18:25 +0300
Message-Id: <1242721105.3623.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-18 at 11:30 -0600, Eric Holmberg wrote:
> Hi Stefan,
> 
> I am still seeing corruption even with the write buffer size limited to
> 8 bytes, but it's greatly limited.

Do you mean, UBIFS still dies when buf. size is 8?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
