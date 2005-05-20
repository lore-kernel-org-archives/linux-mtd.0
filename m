Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ3dE-0000TF-91
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 10:17:24 +0100
Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ3dB-0005zc-JU
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 05:17:22 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Fri, 20 May 2005 17:17:18 +0800
Message-Id: <1116580638.18096.133.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: map and chip drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Breaking things down a little more, in the mtd stack there are 3 kinds of drivers.
> map drivers that describe how to talk to a given flash chip.
> probe drivers that identify what kind of chip you have.
> chip drivers that know how to speak a command set and let you flash your chip.


I really don't understand the difference between the map and the chip
driver? 

talk to a given flash !
speak a command set!

ain't they the same?

-- 
Munira Ahmed
