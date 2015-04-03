Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ye5HH-0003Ov-Mt
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2015 17:21:08 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Andrea Scian <rnd4@dave-tech.it>, mtd_mailinglist
 <linux-mtd@lists.infradead.org>
Subject: RE: [MLC NAND]: data pattern sensivity
Date: Fri, 3 Apr 2015 17:20:29 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>
References: <551E615D.3090804@dave-tech.it>
In-Reply-To: <551E615D.3090804@dave-tech.it>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm always glad to help out. I'm not sure I quite understand the meaning of=
 "data pattern sensivity", but when I read it seem related to ECC code word=
 size and Cyclicdesign.com is a good resource and in particular http://cycl=
icdesign.com/whitepapers/Cyclic_Design_NAND_ECC.pdf.  If I'm off track let =
me know and I will keep looking.



Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc

-----Original Message-----
From: Andrea Scian [mailto:rnd4@dave-tech.it]=20
Sent: Friday, April 03, 2015 2:46 AM
To: mtd_mailinglist
Cc: Boris Brezillon; Jeff Lauruhn (jlauruhn)
Subject: [MLC NAND]: data pattern sensivity


Dear All,

I was looking inside Boris presentation at latest ELC (nice work!) and tryi=
ng to understand a bit deeper the systematic data pattern problem.
I also did some research on this ML, looking for some details about this to=
pic, finding not so much more the original RFC thread:

http://thread.gmane.org/gmane.linux.drivers.devicetree/72230/

I search for this kind of information inside various MLC NAND datasheets th=
at I've available on my desk but I cannot find any reference on this, maybe=
 is called in a different way or maybe I'm looking to the wrong devices (e.=
g. I'm currently working with some Micron NANDs MT29F32G08CBADA, MT29F32G08=
CBACA..)

I CCed Boris and Jeff directly because maybe they can help me in better und=
erstanding the impact of this problem on some real device.

TIA & BR,

--=20

Andrea SCIAN

DAVE Embedded Systems
