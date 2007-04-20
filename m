Received: from pc125.solomon-systech.com ([202.76.106.125]
	helo=virus-gateway.solomon-systech.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HemX1-0000DX-L0
	for linux-mtd@lists.infradead.org; Fri, 20 Apr 2007 02:23:47 -0400
Received: from SSLEXCHANGE.solomonsystech.com
	(cluster_server1.solomonsystech.com) by
	sweeper_server.solomonsystech.com
	(Content Technologies SMTPRS 4.3.6) with ESMTP id
	<T7f1bca2adfac100003aac@sweeper_server.solomonsystech.com> for
	<linux-mtd@lists.infradead.org>; Fri, 20 Apr 2007 14:24:40 +0800
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: NAND device ID 0xd5 appears twice in nand_ids.c table
Date: Fri, 20 Apr 2007 14:23:22 +0800
Message-ID: <6334E09627481B4AA5C8DE1E69E19D3B06BF9703@SSLEXCHANGE.solomonsystech.com>
From: <sasin@solomon-systech.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[resending w/o "Re:", apparently a "suspicious header"]
The problem is that there is no geometry information in the ID bytes for
the older parts with page size 512 bytes and below, which is the case
for the 4MiB part.  Unsure if anyone has compiled a dump of ID bytes for
the older parts so that there is some fixed pattern to rely upon to
differentiate.
