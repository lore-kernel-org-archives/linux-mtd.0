Received: from f3.law15.hotmail.com ([64.4.23.3] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15L1U3-0002EN-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 12:51:48 +0100
From: "Tapio Lindh" <talindh@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Can't write to non-CFI 64Mbit Amd chip
Date: Fri, 13 Jul 2001 11:56:47 -0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F3FsTmIClmpcQABZTW500009bb3@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I found out the reason why writes failed: Sectors were locked even
thou the VPP was enabled. Sectors had to be explicitly opened using unlock 
command. Writing and erasing was possible after implementing
an unlock function for amd_flash and using then unlock utility.

Tapio Lindh
_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
