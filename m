Received: from ppp-08-005.001.starnetwx.net ([66.19.63.5] helo=digidescorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D14Zg-00031h-Bg
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 10:25:17 -0500
Received: from banana ([192.168.254.111])
	by digidescorp.com (digidescorp.com [192.168.254.251])
	(MDaemon.PRO.v7.1.2.R) with ESMTP id md50000031161.msg
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 09:24:19 -0600
From: "Steven J. Magnani" <steve@digidescorp.com>
To: <dedekind@infradead.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 15 Feb 2005 09:24:04 -0600
Message-ID: <005101c51372$659fd420$6ffea8c0@banana>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108454688.26412.18.camel@sauron.oktetlabs.ru>
Cc: 
Subject: RE: Bug in jffs2/scan.c re: incorrect assumption of "allclean"block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Well, I've looked trough your debug output and the code and think the
following patch should fix the bug.

That also seems to work. I assume that the test for "jeb->used_size ==
PAD(c->cleanmarker_size)" assures that jeb->first_node is non-NULL, so
dereferencing it won't ever cause an oops.

Should the code at line 631 be changed to look more like your patched
code? (Why the difference?)

Steve
