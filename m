Received: from mgw-x1.nokia.com ([131.228.20.21])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NsTd-0008HP-9X
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 12:00:13 +0100
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com
	[172.21.143.33])h55B0nW20298	for <linux-mtd@lists.infradead.org>;
	Thu, 5 Jun 2003 14:00:49 +0300 (EET DST)
Received: from esebh001.NOE.Nokia.com (unverified) by esvir01nok.ntc.nokia.com
	<T62a4adce45ac158f21107@esvir01nok.ntc.nokia.com> for
	<linux-mtd@lists.infradead.org>; Thu, 5 Jun 2003 14:00:48 +0300
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 5 Jun 2003 19:00:04 +0800
Message-ID: <AEB09EDA2548094C81ED6AA93269F63D01D0925F@siebe001.apac.nokia.com>
From: <Srinivasu.Vaduguri@nokia.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: NAND Chips - "Erase success and failed writes !!!"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am facing a strange problem in some of our devices which uses Samsung =
64MB NAND chips..=20
The blocks didnt report any bad blocks initially. But after some days =
one of the block
Erase is succesfull but reports  "Failed write" after programming the =
page..=20

And in some devices I found "Erase fails" and write successful.. But in =
this case "Write-verify" fails..

Anybody faced this problem before.. or has any clues..

Thanx in advance,

regards,
Srini
