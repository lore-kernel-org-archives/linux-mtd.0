Received: from mail21.sea5.speakeasy.net ([69.17.117.23])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4Omn-0000oE-29
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 14:36:33 -0500
Received: from unknown (HELO [172.16.6.181]) (msundius@[12.47.55.31])
	(envelope-sender <msundius@sundius.com>)
	by mail21.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 24 Feb 2005 19:34:29 -0000
Mime-Version: 1.0 (Apple Message framework v619.2)
Content-Transfer-Encoding: 7bit
Message-Id: <1f065e28ae2a88eda8f37b9c40f54ed2@sundius.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
To: linux-mtd@lists.infradead.org
From: C. Michael Sundius <msundius@sundius.com>
Date: Thu, 24 Feb 2005 11:34:34 -0800
Subject: utilities for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using a the mtd code from the 2.4.20 kernel. how/where do I get 
the corresponding utilities
such as flash_erase, flash_lock etc... I grabbed a random version of 
them somewhere and it
didn't seem to work.. for one the flash_erase program calls an ioctl 
"MEMGETREGIONCOUNT"
and my kernel returned:
	in appropriate ioctl for this device....

any help is appreciated.

thanks



C Michael Sundius
Solico Group LLC
232 Nevada St
San Francisco, CA 94110
msundius@sundius.com
(415)608-0121
