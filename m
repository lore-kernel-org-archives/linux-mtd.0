Received: from 68.143.134.205.nw.nuvox.net ([68.143.134.205]
	helo=smtpgateway.raleigh.signalscape.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LaG7L-0003KZ-Se
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 21:07:38 +0000
Received: from smtpgateway.raleigh.signalscape.com (127.0.0.1) by
	smtpgateway.raleigh.signalscape.com (MlfMTA v3.2r9) id
	hjn3ka0171sj for <linux-mtd@lists.infradead.org>;
	Thu, 19 Feb 2009 15:55:32 -0500 (envelope-from <bobr@signalscape.com>)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Abrupt power loss for JFFS2
Date: Thu, 19 Feb 2009 16:08:03 -0500
Message-ID: <CDF639F6A8F1EA4DB0F86DEFD506216C018E4204@penn.raleigh.signalscape.com>
From: "Richards, Bob" <bobr@signalscape.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What is the current reliability for JFFS2 if it is writing a new dirent
node (say due to a "mv a, b" command)?  Does the NOR code implementation
always write the new dirent node to physical flash before the old dirent
node in flash is erased due to GC?=20

Thanks
