Received: from auemail1.lucent.com ([192.11.223.161]
	helo=auemail1.firewall.lucent.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7bCr-0007sY-4A
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 14:51:53 +0100
Received: from ixstar.ih.lucent.com (h135-1-99-7.lucent.com [135.1.99.7])
	ESMTP id h99DoL800082	for <linux-mtd@lists.infradead.org>;
	Thu, 9 Oct 2003 08:50:21 -0500 (CDT)
To: linux-mtd@lists.infradead.org
From: "Greg A. Martin" <gregmartin@lucent.com>
Date: Thu, 9 Oct 2003 08:50:17 -0500
Message-ID: <000101c38e6c$469fdd40$1a53b987@na02.lucent.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Nand Flash with 2048 Byte Page sizes
Reply-To: gregmartin@lucent.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I haven't seen any references yet to the newer NAND devices from Samsung
that have 2048 byte
pages with 64 bytes extra data. The Part numbers are K9F1G08U0M and
K92G08U0M. These
are 1 and 2 Gbit devices with 11 bit column addresses and 16 or 17 bit page
addresses that need
two byte read commands. Any idea if support for these devices will be forth
coming soon, or do
I get to blaze a trail?

Greg
