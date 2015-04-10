Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgP5W-0003T1-1H
 for linux-mtd@lists.infradead.org; Fri, 10 Apr 2015 02:54:36 +0000
From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
Subject: Re: [MLC NAND]: data pattern sensivity
Date: Fri, 10 Apr 2015 02:52:45 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B631B4E8B5@NTXXIAMBX02.xacn.micron.com>
References: <mailman.1.1428433201.16973.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.1.1428433201.16973.linux-mtd@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>Some MLC chips require a randomization step: take a look at this
>datasheet [1], page 21:
>"Users are required to employ randomizer function in the NAND
>controller to meet target endurance of the device."

>[1]http://www.100y.com.tw/pdf_file/37-SAMSUNG-K9GBG08U0A-SCB0.pdf


>--=20
>Boris Brezillon, Free Electrons
>Embedded Linux and Kernel engineering
>http://free-electrons.com

I think,it's hard to implement randomizer function,
So far,I also have not heard any about it.
but , IIUC , It is associated with FS/ Nand controller.
