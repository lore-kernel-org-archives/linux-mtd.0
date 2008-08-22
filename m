Received: from nf-out-0910.google.com ([64.233.182.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWSTE-0005iW-UX
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 08:58:13 +0000
Received: by nf-out-0910.google.com with SMTP id d21so269689nfb.22
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 01:58:12 -0700 (PDT)
Message-ID: <ac9c93b10808220158p13528b81t7dbb0eb6a6d8a5a8@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:58:12 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "Singh, Vimal" <vimalsingh@ti.com>
Subject: Re: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C1C@dbde02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	<ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
	<1219385223.18027.105.camel@sauron>
	<19F8576C6E063C45BE387C64729E739403CD517C1C@dbde02.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Woodhouse <dwmw2@infradead.org>,
	"David@mgw-mx06.nokia.com" <David@mgw-mx06.nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vimal,

This is not a diff against the latest git version.

E.g. this line

> -       if (nr_bits == 11) {    /* correctable error */

was already replaced by the 0x55 tests in this commit:
http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=1077be58ad7baadd86e47e8b4f6209fa5b6364a5


Also in your diff I see that this patch:
http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=17c1d2be28e485c0c8b09661db39d5bf2605069d
is not in the version you compare against.

I suggest to merge your changes with the mtd git version of nand_ecc.c
The current HEAD for this file can be found here:
http://git.infradead.org/mtd-2.6.git?a=blob_plain;f=drivers/mtd/nand/nand_ecc.c;hb=17c1d2be28e485c0c8b09661db39d5bf2605069d

Best regards, Frans.
