Received: from mail.frequentis.com ([213.47.210.148])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193wse-0003ik-8n
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 12:39:40 +0100
Message-Id: <se96c581.053@mail.frequentis.com>
Date: Fri, 11 Apr 2003 13:39:06 +0200
From: "Gerhard TAEUBL" <Gerhard.TAEUBL@frequentis.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Subject: Intel 28F320 Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi to all!

In our company we use the 28F320 3V3 flashes. The WP ist connected to low, =
RP is high. So it isn't possible to lock or unlock any block. Also after =
production we test the wholeflash (only word write, not buffer write).

So far so good.

On some hardware (1 -3%) it isn't possible to use the jffs2 filesystem. If =
we copy files the copy comand will be aborted. After searching in the code =
and do some additional output, I see, that one flash (we have two in =
parallel manner for 32 bit access) has set SR.1 bit after the buffer write =
command.=20

Hum, only one of both... and all pins a right connected.
So I write an own test program for flash and buffer write =3D> everything =
seems to be OK! The only difference is, that I check the whole status word =
if it is correct not like in the cfi_cmdset program to mask only the OK =
bit.

If I comment this & code (if ((status /*& status_OK*/) =3D=3D status_OK)) =
then everything works fine.

Is this a sw bug or the 28F320 chip has a defect?

Thanks for any hint

best regards
Gerhard

P.S. I'm not member of this mailing list, so address me direct!
