Received: from mgw-dax1.ext.nokia.com ([63.78.179.216])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WF1j-0001ON-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 12:09:43 +0000
Received: from davir04nok.americas.nokia.com (davir04nok.americas.nokia.com [172.18.242.87])
	by mgw-dax1.ext.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h08CecE13652
	for <linux-mtd@lists.infradead.org>; Wed, 8 Jan 2003 06:40:38 -0600 (CST)
Received: from daebh001.NOE.Nokia.com (unverified) by davir04nok.americas.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5fa8ed8ae9ac12f25711c@davir04nok.americas.nokia.com> for <linux-mtd@lists.infradead.org>;
 Wed, 8 Jan 2003 06:40:33 -0600
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: CRAMFS on MTD/NAND Issue
Date: Wed, 8 Jan 2003 04:40:31 -0800
Message-ID: <F252EE46074AB645B4F44947EEAD5727C83809@mvebe001.americas.nokia.com>
From: <Srinivasu.Vaduguri@nokia.com>
To: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,

I am trying to mount CRAMFS using MTD driver on a NAND flash.=20
If there is a BAD block in the CRAMFS area of the NAND flash then i get =
the following error during mount.=20

Error -3 while decompressing!
802c3674(666163445)->83d7d000(4096)

Then the applications on the mounted cramfs are not running properly.

any suggestions are appreciated..

thanx in advance,

regards,
Srini
