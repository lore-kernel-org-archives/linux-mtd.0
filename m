Received: from mail1.speakeasy.net ([216.254.0.201])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CTqoD-0005fM-Dx
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 19:03:15 -0500
Received: from unknown (HELO [172.16.6.45]) (msundius@[12.47.55.31])
	(envelope-sender <msundius@sundius.com>)
	by mail1.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 16 Nov 2004 00:02:49 -0000
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Message-Id: <D4194EA8-3762-11D9-9C6E-000A95BE1940@sundius.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
To: linux-mtd@lists.infradead.org
From: C. Michael Sundius <msundius@sundius.com>
Date: Mon, 15 Nov 2004 16:02:38 -0800
Subject: support for serial flash roms
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

have you all added support for serial flash in the later versions of 
MTD? if so
what chips do you support. I am working on supporting a platform that 
could configure
any of the following devices and using the SPI bus to talk to the 
chips..

	MICROCHIP 25AA640,
	ST M25P80
	AMTEL AT45DB642

if any (or all) of these are supported could you point me to the code?

thanks


C Michael Sundius
Solico Group LLC
232 Nevada St
San Francisco, CA 94110
msundius@sundius.com
(415)608-0121
