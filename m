Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu7jK-0006qM-Cp
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 16:13:01 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090415160921.GA4325@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2009 19:12:03 +0300
Message-Id: <1239811923.3390.191.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, Eric Holmberg <Eric_Holmberg@Trimble.com>,
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

On Wed, 2009-04-15 at 17:09 +0100, Jamie Lokier wrote:
> Do the CFI block writes have to be aligned (to 64 bytes) offset, or
> can the 64 bytes start at any word position?

Yeah, good question. I wanted to ask the same.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
