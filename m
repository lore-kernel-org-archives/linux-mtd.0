Received: from dsl093-192-209.stl1.dsl.speakeasy.net ([66.93.192.209]
	helo=newman.jbmsoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197eEp-0002cu-LO
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 17:33:53 +0100
Received: from brianpc (BriansPC.jbmsoft.com [192.10.10.21])
	by newman.jbmsoft.com (Postfix) with SMTP id DCE7190306
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Apr 2003 11:53:57 -0500 (CDT)
Message-ID: <015701c30823$c19438e0$150a0ac0@jbmsoft.com>
From: "Brian T." <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 11:33:35 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: mount a jffs2 image
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I was wondering if there is a way to mount a jffs2 image on a system which
has no mtd devices, such as the system I use (Redhat 7.1) to build an
embedded distro.  I am using a 2.4.20 mtd patched kernel, but I get errors
when trying to mount it on mtd devices (since they are not there).  "mount"
tells me to try using "-o /dev/loop0" but that locks the system up.  Thanks!

-Brian
