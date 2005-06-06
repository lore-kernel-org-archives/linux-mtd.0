Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfHCh-00081X-1D
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 08:59:44 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 461A5229A6
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2005 16:59:08 +0400 (MSD)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 06 Jun 2005 16:59:07 +0400
Message-Id: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: JFFS3 superblock search
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

in order not to lose your attention I decided to announce that the JFFS3
design document (v0.1) now has a description of the Superblock
management scheme. It allows to solve the slow mount problem and admits
of locating the position of the Superblock for < 2ms (you'll find some
digits in the document). Any suggestions, criticism etc are appreciated.


P.S. Since the document has no description of the general approach of
storing data in JFFS3, I'll note that I'm thinking about a Reiser4-like
approach, i.e., storing all the FS data in one 4-level B+ tree. There
will be a superblock containing the FS description and admitting of very
fast JFFS3 mount.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
