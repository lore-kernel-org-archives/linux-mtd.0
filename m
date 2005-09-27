Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKKlr-0000XO-Ij
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 15:05:51 -0400
Received: from jmd (w238.z208176144.sjc-ca.dsl.cnc.net [208.176.144.238])
	(authenticated bits=0)
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j8RIOdYu024968
	(version=TLSv1/SSLv3 cipher=DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 27 Sep 2005 11:24:39 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 27 Sep 2005 11:47:25 -0700
MIME-Version: 1.0
Message-ID: <4339314D.19952.911E55@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Updated Grub DOC patch?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having a hell of a time compiling GRUB with the DOC patch.  The 
old versions of GRUB won't compile using the recent versions of GCC 
(see grub bug #3343 and 8729).  Fine.  So I load RedHat 7.3, but that 
has too old a version of autoconf and automake.  And automake-
1.5.tar.gz on the Gnu site is corrupted!  (It appears RH8 has the 
required automake 1.5 and autoconf 2.53, but I don't have that). 

I'm wondering if it would be more worth my time to rework the latest 
patch (grub-2003-11-10-doc.patch) to work with the more recent 
versions of grub. (0.96 for example)

Has anyone attacked this recently?  I saw a couple unanswered posts 
within the last 6 months (is that all, just a couple posts?) from 
others who are having this problem.  Perhaps someone else has solved 
this allready (I hope...)

- Joe 
