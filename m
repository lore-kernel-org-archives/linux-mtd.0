Received: from [61.186.188.65] (helo=gjx)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZLo5-0000XC-Kw
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 03:32:46 +0100
From: "gjx" <marchguo@yahoo.com.cn>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Date: Mon, 7 Jul 2003 10:33:21 +0800
Message-Id: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Subject: nand flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,linux-mtd

=09 The hardware designer connects the control pins(CLE=A1=A2ALE=A1=A2R/B)=
 of nand flash to the data bus, The CE=A1=A2WE=A1=A2RE pins to=
 corresponding pin of CPU. Nedd I get the address of control=
 pins? separate the data from data bus? How to implement=
 controlling of nand.   Please give me some advice, thanks!


=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1gjx
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1marchguo@yahoo.com.cn
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12003-07-07
