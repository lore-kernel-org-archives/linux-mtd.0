Received: from motgate4.mot.com ([144.189.100.102])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0xHd-0002iA-0R
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 05:14:59 -0400
Received: from az33exr04.mot.com (az33exr04.mot.com [10.64.251.234])
	by motgate4.mot.com (8.12.11/Motgate4) with ESMTP id k6D9EoRP013997
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Jul 2006 02:14:50 -0700 (MST)
Received: from ZMY16EXM67.ds.mot.com (zmy16exm67.ap.mot.com [10.179.4.27])
	by az33exr04.mot.com (8.13.1/8.13.0) with ESMTP id k6D9ElTw010174
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Jul 2006 04:14:49 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Nand read/write
Date: Thu, 13 Jul 2006 17:14:46 +0800
Message-ID: <B7803DC652E2F9458758AEBB6A5FD60FF88D90@ZMY16EXM67.ds.mot.com>
From: "M Sudharshana-A18475" <sudharshana@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have the following scenario on an embedded Linux application.

There is a partition in the NAND flash memory (with RAW type, no file
system), which will be mounted and used for read/write. As an
application which performs "read"/"write" on this partition after
mounting, should it be assumed that "bad block algorithm" is covered? Or
application has to handle the same?

Thanks for your help

Sudharshana
