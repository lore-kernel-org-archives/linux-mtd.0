Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjdlR-0001Yg-BW
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 20:53:09 +0000
Received: by vws8 with SMTP id 8so577242vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 13:53:01 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 20 Jul 2011 16:53:00 -0400
Message-ID: <CAJcvjphp3Cjew0=P6LWQ05Hb6HWpPy3D2FOBd8J5KwVGQpwcwA@mail.gmail.com>
Subject: UBIFS support for SLC and MLC
From: John <jtburch62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm exploring flash memory technology for a new product and am
confused about whether UBIFS fully supports SLC and MLC NAND. =A0When I
read the FAQ at
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc, it
states that one of the two aspects of MLC that are not supported is
"program disturb". =A0However, the document link referenced in the same
FAQ (http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc)
states that "program disturb" is common to both SLC and MLC - just at
different error rates.

1. =A0How does UBIFS address the "program disturb" effect in SLC NAND?

2. =A0Why doesn't the FAQs explanation for how UBIFS handles "read
disturb" apply to "program disturb"?

Thanks,
John
