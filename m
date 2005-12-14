Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmZ8N-00011G-DU
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 11:05:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id CFC2F29EBC
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Dec 2005 17:03:58 +0100 (CET)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 11707-09 for <linux-mtd@lists.infradead.org>;
	Wed, 14 Dec 2005 17:03:57 +0100 (CET)
Received: from linux.local (linux.prtnl [192.168.1.97])
	by protonic.prtnl (Postfix) with ESMTP id 97F7029EBB
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Dec 2005 17:03:57 +0100 (CET)
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
Date: Wed, 14 Dec 2005 17:05:30 +0100
References: <014601c5ffb6$24baa670$106215ac@realtek.com.tw>
	<01dc01c60057$1b3fab30$106215ac@realtek.com.tw>
	<439FD5BF.1090507@mw-itcon.de>
In-Reply-To: <439FD5BF.1090507@mw-itcon.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="big5"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512141705.31619.david.jander@protonic.nl>
Subject: Re: Does Linux have serial flash drivers?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 December 2005 09:20, Peter Menzebach wrote:
>[...]
> Maybe, because most boards will then need 2 flashs with different
> interfaces. Afaik only the Atmel at91... can boot directly from serial

This is actually quite conceivable. Have a small parallel NOR-Flash for 
boot-loader+kernel, and a huge serial nand-flash (cheaper per-Mb) as flash 
disk.
Btw, I was wondering the same.
AFAICR, there is QSlinux (do they still exist today?), that made a serial 
flash driver (via SPI) and used serial data-flash as fs.

Greetings,

-- 
David Jander
