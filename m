Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 186tAn-0000g2-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 13:46:17 +0000
Message-ID: <2702075D4DE2B043BF5EB82E9CFAD45B42EBCB@mail1.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: cfi_cmdset_0002.c: Timeout for writing
Date: Wed, 30 Oct 2002 09:16:27 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

It is correct as long as HZ/1000 gives you a 1ms value.  Most of CFI =
flash
device should never take more that a couple of hundreds of microseconds =
to
write a word.  Nevertheless, to prevent that  jiffies + (HZ/1000) =3D =
jiffies,
meaning that HZ/1000 =3D 0, we could replace the line 511 by

timeo =3D jiffies + (HZ/1000) + 1;

Fr=E9d=E9ric Giasson=20



Hello,

Is this correct?

Line 511 in cfi_cmdset_0002.c, function do_write_oneword:
<  timeo =3D jiffies + (HZ/1000); /* setting timeout to 1ms for now */

Timeo is set to jiffies because HZ/1000 =3D 0. This don't work in our
integration.
We use MTD in a non-linux environment. jiffies are emulated (10 ms)
Nevertheless I think, it's not correct?

Greetings,
Holger












--__--__--

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest
