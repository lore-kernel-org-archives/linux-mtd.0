Received: from pc125.solomon-systech.com ([202.76.106.125]
	helo=virus-gateway.solomon-systech.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HdOjD-0000IG-0D
	for linux-mtd@lists.infradead.org; Mon, 16 Apr 2007 06:46:36 -0400
Received: from SSLEXCHANGE.solomonsystech.com
	(cluster_server1.solomonsystech.com) by
	sweeper_server.solomonsystech.com
	(Content Technologies SMTPRS 4.3.6) with ESMTP id
	<T7f07e600b2ac100003aac@sweeper_server.solomonsystech.com> for
	<linux-mtd@lists.infradead.org>; Mon, 16 Apr 2007 17:42:40 +0800
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: NAND device ID 0xd5 appears twice in nand_ids.c table
Date: Mon, 16 Apr 2007 17:41:21 +0800
Message-ID: <6334E09627481B4AA5C8DE1E69E19D3B06BF96E0@SSLEXCHANGE.solomonsystech.com>
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

NAND device ID 0xd5 appears for a 4MiB device as well as for a 2GiB
device.  So when the new 2GiB device is used, it is detected as the
older 4MiB device.  Should other ID bytes perhaps be used to
differentiate between the two?  This problem will continue as older
device IDs are reused in newer devices.

Best regards,
Sasi
