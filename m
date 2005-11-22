Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EegeD-0007f1-C1
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 17:30:04 -0500
Received: from [192.168.1.143] (w238.z208176144.sjc-ca.dsl.cnc.net
	[208.176.144.238])
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id jAMM387v007516
	for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2005 14:03:08 -0800
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Nov 2005 14:29:52 -0800
MIME-Version: 1.0
Message-ID: <43832B60.4608.125F5D5@dupre.avab.com>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: Quoted-printable
Content-description: Mail message body
Subject: DOC interferes with linux boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ignore that last post.  I meant to delete it, not send.

For the record, the TrueFFS bit of the DOC uses up 69K of 
conventional memory, which is apparently too little for GRUB to load 
the bzImage...

- Joe -- 
Joseph M. Dupr=E9
Design Engineer
SAND Network Systems
+1 707 778 8990 x207
