Received: from as-mail-p6.techem.de ([195.242.190.4])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFivx-0003bw-4B
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 08:52:34 +0000
Received: from AS-MAIL-P6.techem.de ([10.41.224.23])
	by localhost (as-mail-p3.techem.de [10.41.224.25]) (amavisd-new,
	port 10024)
	with ESMTP id 21959-06 for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 10:54:47 +0200 (CEST)
Received: from mx-crypt-p2.techem.de (mx-crypt-p2.techem.de [10.41.224.9])
	by AS-MAIL-P6.techem.de (Postfix) with ESMTP id 258B44E
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 10:52:30 +0200 (CEST)
Received: from mx-crypt-p2.techem.de (localhost [127.0.0.1])
	by mx-crypt-p2.techem.de (Postfix) with ESMTP id F03A0EC40A8
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 10:52:29 +0200 (CEST)
Received: from AS-MAIL-P8.techem.de (as-mail-p8.techem.de [10.50.224.25])
	by mx-crypt-p2.techem.de (Postfix) with ESMTP id CF669EC402D
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 10:52:29 +0200 (CEST)
Received: from mx-be-2.eu.techem.corp (unknown [10.155.224.72])
	by AS-MAIL-P8.techem.de (Postfix) with ESMTP id D5C265B8
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 10:52:29 +0200 (CEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Understanding page size in jffs2- and kernel-source
Date: Mon, 17 Oct 2011 10:52:29 +0200
Message-ID: <CC01CB1DD69AA74C86C6E8D4EAF42403081C7203@mx-be-2.eu.techem.corp>
From: "Freise, Bjoern-Achim" <bjoern-achim.freise@techem.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
=20
we are using Kernel 2.6.28 with mtd-utils 1.0.1 on an ARM at91sam9260 =
with a NAND flash with 512 byte pages an 16k erase size. And now I'm =
trying to understand a few things:
=20
1) In the kernel source it has PAGE_SIZE and PAGE_CACHE_SIZE with 4096. =
These defines are used in the jffs2 implementation. Is that correct when =
using 512 byte pages in a NAND device?
=20
2) In our build-environment our image is created with "mkfs.jffs2 .... =
--page-size=3D512.... ". I guess this doesn't match with the above?
=20
3) What should I use for a good performance (page_size and/or with/out =
compression) when using a large (~ 16MB) sqlite-file?
=20
I'm really unsure with these things.
=20
Regards,
Bj=F6rn Freise


Energiesparen mit adapterm. Mehr Infos unter http://www.techem.de/adapterm
__________________________________________

Techem Energy Services GmbH
Sitz der Gesellschaft: Eschborn
Amtsgericht Frankfurt am Main: HRB 74732
Geschaeftsfuehrung: Hans-Lothar Schaefer (Vors.), Steffen Baetjer, Dr. Rolf Weber
Aufsichtsrat: Hilko Schomerus (Vors.)

This e-mail and any attachment thereto contains confidental and/or privileged information. If you are not the intended recipient or have received this e-mail in error, please notify the sender immediately and delete this e-mail and any attachment thereto from your system. Any unauthorized retention, copying, transmission, distribution, disclosure or use of the content of this e-mail and/or any attachment thereto is prohibited. Techem is not liable for any omission or error in this e-mail and/or any attachment thereto which may arise as a result of the e-mail-transmission or for damages resulting from any unauthorized change of the content of this e-mail and/or any attachment thereto.

Thank You
Techem Energy Services GmbH


Der Inhalt dieser E-Mail und ihrer Anhaenge ist vertraulich und kann rechtlich geschuetzte Informationen enthalten. Falls Sie nicht der richtige Adressat sind oder diese E-Mail irrtuemlich erhalten haben, informieren Sie bitte umgehend den Absender und vernichten Sie diese E-Mail und ihre Anhaenge. Jegliche Offenlegung, Vervielfaeltigung, Weitergabe oder Nutzung des Inhalts dieser Email oder ihrer Anhaenge ist untersagt. Techem haftet nicht fuer Unvollstaendigkeiten und Fehler in dieser E-Mail und /oder ihren Anhaengen, die als Folge der Uebersendung auftreten, oder  fuer Schaeden, die infolge unerlaubter Aenderungen des Inhalts dieser E-Mail und/oder ihrer Anhaenge entstehen.

Vielen Dank
Techem Energy Services GmbH
