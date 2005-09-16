Received: from xproxy.gmail.com ([66.249.82.205])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EGC7x-0000bO-6L
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2005 05:03:40 -0400
Received: by xproxy.gmail.com with SMTP id i26so23294wxd
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Sep 2005 02:03:24 -0700 (PDT)
Message-ID: <5b42f131050916020370766b86@mail.gmail.com>
Date: Fri, 16 Sep 2005 17:03:23 +0800
From: Alpha Root <alpharoot@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: bad block found but data is still written into the bad block
Reply-To: alpharoot@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a 2K page sized Nand flash, which has a bad block. The bad
block can be found by mtd driver:
Scanning device for bad blocks
Bad eraseblock 1513 at 0x0bd20000

However, when I try to copy file into the mtd partition, mtd driver
still writes data into this block. Then when I read back the file I
got I/O errors and the read fails. Does anyone know why this happens?

--
Bill
