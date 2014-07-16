Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7MMQ-0005Jw-Cg
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 10:23:04 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8S001A3VHF9MC0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 19:22:27 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Bean Huo' <beanhuo@outlook.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com
References: <BLU185-W10713E955F9530C4D53490A6F70@phx.gbl>
 <BLU185-W62B0858FCD7D3A71127B41A6F70@phx.gbl>
 <002201cfa0ca$be634b10$3b29e130$%han@samsung.com>
 <BLU185-W44C89261B8307EBFCC2EC0A6F70@phx.gbl>
In-reply-to: <BLU185-W44C89261B8307EBFCC2EC0A6F70@phx.gbl>
Subject: Re: [PATCH v5] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 16 Jul 2014 19:22:27 +0900
Message-id: <003f01cfa0df$d79d5fc0$86d81f40$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-language: ko
Cc: b32955@freescale.com, artem.bityutskiy@linux.intel.com,
 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 paul.gortmaker@windriver.com, linux-mtd@lists.infradead.org,
 christian.riesch@omicron.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, July 16, 2014 5:49 PM, Bean Huo wrote:
>=20
> >> + if (cfi->cfiq->BufWriteTimeoutTyp &&
> >> + cfi->cfiq->BufWriteTimeoutMax){
> >> + cfi->chips[i].buffer_write_time_max =3D
> >> + 1<<(cfi->cfiq->BufWriteTimeoutTyp +
> >> + cfi->cfiq->BufWriteTimeoutMax);
> >> + } else {
> >> + cfi->chips[i].buffer_write_time_max =3D 0;
> >> + }
> >
> > Please keep the coding style as below.
> >
> > if ( ) {
> > ...
> > } else {
> > ...
> > }
> >
>=20
> If I keep coding style as above.this will be beyond the requirements =
of one line length.
> I also saw othter files use the same code style as mine.please =
see:cfi_cmdset_0001.c
>=20
> if (cfi->cfiq->WordWriteTimeoutTyp &&
> =A0 =A0 =A0cfi->cfiq->WordWriteTimeoutMax)
> =A0 =A0 =A0 =A0 cfi->chips[i].word_write_time_max =3D
> 		1<<(cfi->cfiq->WordWriteTimeoutTyp +
> 		=A0 =A0 =A0=A0cfi->cfiq->WordWriteTimeoutMax);
> else
> =A0 =A0 =A0 cfi->chips[i].word_write_time_max =3D 50000 * 8;

I don't want to mention about braces.
However, I said that you should keep the indentation.

Your original patch

+		if (cfi->cfiq->BufWriteTimeoutTyp &&
+			cfi->cfiq->BufWriteTimeoutMax){
+			cfi->chips[i].buffer_write_time_max =3D
+				1<<(cfi->cfiq->BufWriteTimeoutTyp +
+					cfi->cfiq->BufWriteTimeoutMax);
+			} else {
+				cfi->chips[i].buffer_write_time_max =3D 0;
+				}
+		cfi->chips[i].buffer_write_time_max =3D
+			((cfi->chips[i].buffer_write_time_max>=3D 2000)
+			 ? cfi->chips[i].buffer_write_time_max : 2000);

My suggestion is as follows:=20

+		if (cfi->cfiq->BufWriteTimeoutTyp &&
+			cfi->cfiq->BufWriteTimeoutMax){
+			cfi->chips[i].buffer_write_time_max =3D
+				1<<(cfi->cfiq->BufWriteTimeoutTyp +
+					cfi->cfiq->BufWriteTimeoutMax);
+		} else {
+			cfi->chips[i].buffer_write_time_max =3D 0;
+		}
+		cfi->chips[i].buffer_write_time_max =3D
+			((cfi->chips[i].buffer_write_time_max>=3D 2000)
+			 ? cfi->chips[i].buffer_write_time_max : 2000);

Braces? I have no idea. Actually, I prefer to use braces for the
readability. However, according to the Document/CodingStyle,=20
these braces are unnecessary.

However, one thing is clear; 'if' and 'else' should use the same
indentation level as below.

1.=20
	if(){
		...
	} else {
		...
	}

2.
		if(){
			...
		} else {
			...
		}

3.

			if(){
				...
			} else {
				...
			}

Best regards,
Jingoo Han

>=20
> Note: beacuse I cann't send mail by git in office,I send this patch by =
web mail client.So,
> there still a error stype in this patch(web mail client will remove =
some spaces),that is one space
> required before that '>=3D'.I will send again this patch at home.
> For your=A0coding style advice,=A0I will take into account,but i don't =
know if can put one line.
> 	 	   		  =3D
