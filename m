Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOC3P-0002XM-Nr
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 14:54:03 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246978172.2208.13.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
	<1246972892.2208.5.camel@tlvorens3lnx>
	<1246973292.20721.313.camel@localhost.localdomain>
	<1246975692.2208.7.camel@tlvorens3lnx>
	<1246977486.20721.315.camel@localhost.localdomain>
	<1246978172.2208.13.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 17:53:40 +0300
Message-Id: <1246978420.20721.317.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-07 at 17:49 +0300, Oren wrote:
> Do not see any UBI msg...
> Is there any other configuration options i need to set up?

Did you try dmesg?

The link I provided contains the description about how to capture the
messages:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

See the "Debugging messages" sub-section.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
