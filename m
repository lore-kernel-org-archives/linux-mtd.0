Received: from motgate8.mot.com ([129.188.136.8])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESnq1-0002U7-LI
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 23:45:06 -0400
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (8.12.11/Motgate7) with ESMTP id j9L3uTes002374
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2005 20:56:29 -0700 (MST)
Received: from ZMY16EXM67.ds.mot.com (zmy16exm67.ap.mot.com [10.179.4.27])
	by il06exr04.mot.com (8.13.1/8.13.0) with ESMTP id j9L3qWdx000542
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2005 22:52:33 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Oct 2005 11:44:38 +0800
Message-ID: <B7803DC652E2F9458758AEBB6A5FD60F19526E@ZMY16EXM67.ds.mot.com>
From: "M Sudharshana-A18475" <sudharshana@motorola.com>
To: <linux-mtd@lists.infradead.org>
Subject: NAND Low level flash routiens
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
	I do believe NAND flash manufacturers give low level flash
routines to erase/program data on the flash memory. While providing
them, they do mention unit of erase is of minimum 4K. Would this still
hold good with low level flash routines that some embedded device
manufacturers? Or would this erase be of the unit of sector size which
are usually of 64K/128K/256K ?

Thanks
Sudhi
