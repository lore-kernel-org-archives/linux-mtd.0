Received: from ms1.mail2000.com.tw ([211.72.252.190])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 159rRt-0001Q7-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 17:55:25 +0100
From: "=?big5?B?S2lyayBMZWU=?=" <mpc@mail2000.com.tw>
Reply-To: mpc@mail2000.com.tw
Subject: =?big5?B?UmU6IFBhdGNoIHRvIHN1cHBvcnQgVFFNOHh4TCBi?=
	=?big5?B?b2FyZA==?=
Message-ID: <992365228.18352.mpc@mail2000.com.tw>
To: "" <dwmw2@infradead.org>
Cc: "" <linux-mtd@lists.infradead.org>
Date: Wed, 13 Jun 2001 01:00:28 +0800 (CST)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="---9w-Wcw4BZ+p+zzdnMfh-rnkO:1q"
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

-----9w-Wcw4BZ+p+zzdnMfh-rnkO:1q
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: quoted-printable

>>=20+dep_tristate=20'=20=20CFI=20Flash=20device=20mapped=20on=20>>TQM8xxL'=20=
CONFIG_MTD_TQM8xxL=20$CONFIG_MTD_CFI=20>>$CONFIG_TQM8xxL
>It's=20normal=20to=20have=20config=20options=20in=20all=20>capitals.=20Also=
,=20we=20require=20a=20Configure.help=20entry=20>for=20this=20option.

=20Fixed=20and=20also=20add=20related=20entry=20into=20Configure.help.

>>CFI_LITTLE_ENDIAN......
>Actually=20HOST_ENDIAN=20should=20also=20work,=20shouldn't=20it?

=20I=20just=20take=20a=20rough=20try.
=20HOST_ENDIAN=20does=20not=20work.
=20TQM8xxL=20is=20a=20Embedded=20PowerPC=20based=20board,=20MPC8xx
=20series,=20and=20ppc-linux=20for=20that=20series=20use=20'lwbrx'=20
=20and=20'stwbrx'=20instruction=20to=20implement=20'readl'
=20and=20'writel'.
=20This=20may=20be=20the=20reason,=20I=20guess.....

>>=20+#ifndef=20CONFIG_MTD_TQM8xxL
>>=20+#error=20This=20is=20for=20TQM8xxL=20platform=20only
>>=20+#endif
>Please=20omit=20this.=20It=20shouldn't=20be=20necessary.

=20Fixed.

=20Thanks

=20kirk


----=3D=3D=20Mailed=20via=20Openfind=20=3D=3D-----
http://mail2000.com.tw/=20=B4=A3=A8=D1=A7K=B6O=B9q=A4l=B6l=A5=F3=ABH=BDc


-----9w-Wcw4BZ+p+zzdnMfh-rnkO:1q
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="patch-mtd-snapshot20010610.gz"

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

-----9w-Wcw4BZ+p+zzdnMfh-rnkO:1q--
