Received: from lmsmtp03.st1.spray.net ([212.78.202.113])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UX91-0004lq-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 19:06:11 +0000
Received: from lycos.de (p50859B6D.dip.t-dialin.net [80.133.155.109])
	by lmsmtp03.st1.spray.net (Postfix) with ESMTP id A2A1B3CF11
	for <linux-mtd@lists.infradead.org>; Fri,  3 Jan 2003 20:36:29 +0100 (MET)
Message-ID: <3E15E63A.4060203@lycos.de>
Date: Fri, 03 Jan 2003 20:36:26 +0100
From: Indy500 <indy5xl@lycos.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to compile mkfs.jffs2?
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi

I can't compile mkfs.jffs2. I tried both methods as described in Readme. 
Once with Symlink and once with copying the whole util DIR to the Kernel 
tree. I tried it with an unpatched 2.4.20 Kernel and with a 2.4.20 
Kernel patched with patchin.sh....always there are several errors and 
compiling stops.

Is the description in README too old or is there another undocumented 
Trick to compile successfully this Prog? I must have this binary because 
I'm not able to go on further with my work.

Thank you for any solution.
