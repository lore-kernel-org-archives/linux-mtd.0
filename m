Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kpl8Q-0001BL-UB
	for linux-mtd@lists.infradead.org; Tue, 14 Oct 2008 14:44:31 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m9EEhkaB025602
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2008 09:44:27 -0500
Subject: Some more ubifs docs
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2008 17:42:47 +0300
Message-Id: <1223995367.4029.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

because many people are confused about where is UBIFS used,
I've added this piece of documentation:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_raw_vs_ftl

It also tries to answer the question like "what is better, FTL device +
traditional FS or raw flash + UBIFS". Because some things may appear to
be questionable, I'd ask people to take a look at this.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
