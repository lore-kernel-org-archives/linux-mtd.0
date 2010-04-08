Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NztiY-0006cl-CC
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 15:32:31 +0000
Received: by fg-out-1718.google.com with SMTP id e21so879119fga.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Apr 2010 08:32:28 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20100408152138.GA13059@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133513.20107.72328.stgit@shiryu.yomgui.biz>
	<20100408152138.GA13059@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 8 Apr 2010 17:32:08 +0200
Message-ID: <r2hb8e9195f1004080832v76cc8f20x941d6d2eb697850f@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/4/8 Wolfram Sang <w.sang@pengutronix.de>:
>> +/* Used to fix CFI-Tables of chips without Extended Query Tables
>> + */
>> +static struct cfi_fixup cfi_nopri_fixup_table[] =3D {
>> + =C2=A0 =C2=A0 { CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39V=
F1602
>
> I got a build error. CFI_MFR_SST is missing.

This patch depends on this commit
http://git.infradead.org/mtd-2.6.git/commit/f3e69c6584be2db1ccd5292d6a1d7c5=
66d265701.
Your personnal repo must be outdated.


--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
