Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HP2Bk-0001v7-Pd
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 14:52:45 -0500
Received: from vpn.vernier.com ([69.30.123.186] helo=[192.168.254.67])
	by server37.tchmachines.com with esmtpa (Exim 4.63)
	(envelope-from <linux@architechnical.net>) id 1HP2BW-0001a3-Pd
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 14:52:26 -0500
Message-ID: <45EF17ED.8000908@architechnical.net>
Date: Wed, 07 Mar 2007 11:52:13 -0800
From: Pete MacKay <linux@architechnical.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd-utils-1.0.1 for arm-linux?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been unable to build this release (or the git code) with 
arm-linux-gcc 3.4.4 due to header problems and am desperately seeking 
binaries I can use with a OneNAND under 2.6.18 on a PXA-270.  (I didn't 
have these problems building mtd-utils-1.0.0 but get an oops writing a 
jffs2 image to a OneNAND partition with nandwrite).  Long story short we 
release in 6 days so I'm just seeking a newer nandwrite to try.

Thanks Much!
