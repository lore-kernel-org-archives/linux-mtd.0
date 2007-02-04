Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDe2D-00023E-5G
	for linux-mtd@lists.infradead.org; Sun, 04 Feb 2007 04:51:48 -0500
Subject: Re: chip_ready patch for SST39VF640xB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Niels Gram Jeppesen <ngj@danelec-marine.com>
In-Reply-To: <4F576438CB468649B9FD55650B93FA238DB4A1@bes01.blokken.lan>
References: <4F576438CB468649B9FD55650B93FA238DB4A1@bes01.blokken.lan>
Content-Type: text/plain; charset=utf-8
Date: Sun, 04 Feb 2007 11:51:39 +0200
Message-Id: <1170582699.3628.33.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
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

On Fri, 2007-02-02 at 17:03 +0100, Niels Gram Jeppesen wrote:
> In cfi_cmdset_0002.c, chip_ready seems to be unreliable on the SST39VF640=
xB chip. The attached patch add two extra reads to chip_ready in accordance=
 with the chip data sheet (page 3, "Write Operation Status Detection"). Thi=
s seems to make the write cycle completion detection reliable. I have not t=
ested the patch on any other chips but I would think that it would be harml=
ess on chips that do not need the extra reads.

1. The patch is not applicable to mtd-2.6.git.
2. Please, add Siged-off-by line.
Look here please: http://www.linux-mtd.infradead.org/source.html

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
