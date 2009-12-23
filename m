Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NNUlM-0000et-ER
	for linux-mtd@lists.infradead.org; Wed, 23 Dec 2009 17:12:44 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Wolfgang Denk" <wd@denx.de>,
	"Lauren Del Giudice" <lauren@wyplay.com>
Date: Wed, 23 Dec 2009 09:12:22 -0800
Subject: RE: UBI - exclude bootloader blocks from wear levelling
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFC17927@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<20091223063242.B63923F6EF@gemini.denx.de>
In-Reply-To: <20091223063242.B63923F6EF@gemini.denx.de>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think Lauren must have been referring to a bootloader that lives outside =
the kernel and file system context. For example, a small, standalone bootlo=
ader downloaded from a serial port to it's own partition, would not be know=
n to the kernel, as it is used to launch the kernel or later stage bootload=
ers. In this case it runs standalone and can't sit on UBI or be launched by=
 a linux app. If this small bootloader was only a block or two in size, and=
 since it is typically burned once for production and then becomes read-onl=
y for each bootup after that, wear levelling is not required or possible.

Flash data retention periods are usually specified in years, and flash writ=
e/erases are in cycles. MLC and SLC flashes typically mention 10 year lifet=
imes in their data sheets, and the program/erase cycles are typically 100K-=
1M for SLC, and 10K-100K for MLC. As such I don't see an issue wrt boot loa=
der integrity on factory burning or years of subsequent bootups.=20

Hope this helps a bit.=20

Darwin

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Wolfgang Denk
Sent: Tuesday, December 22, 2009 10:33 PM
To: Lauren Del Giudice
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI - exclude bootloader blocks from wear levelling

Dear Lauren Del Giudice,

In message <4B2FA658.6010407@wyplay.com> you wrote:
> I'm new to UBI... I understood that static wear levelling is applied
> accross the whole device (a NAND device in my case); If so, how can
> I exclude blocks reserved for the bootloader from wear levelling?

Why would you want to do that? You should be happy that UBI also
applies wear levelling to the bootloader storage, as this prevents
your device from bricking when read errors develop there. Keep in mind
that NAND blocks will develop read errors even if you only read them
(i. e. there is not only a limit on the number of erase cycles of such
a device, but also on the number of read cycles).

It is a great benefit if your boot loader gets loaded from a UBI
partition instead of raw NAND.

Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Even if you aren't in doubt, consider the mental welfare of the  per-
son who has to maintain the code after you, and who will probably put
parens in the wrong place.          - Larry Wall in the perl man page

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
