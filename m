Received: from blu004-omc4s37.hotmail.com ([65.55.111.176])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Kti-0000NN-Mq
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 08:49:11 +0000
Message-ID: <BLU185-W44C89261B8307EBFCC2EC0A6F70@phx.gbl>
From: Bean Huo <beanhuo@outlook.com>
To: Jingoo Han <jg1.han@samsung.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH v5] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 16 Jul 2014 08:48:49 +0000
In-Reply-To: <002201cfa0ca$be634b10$3b29e130$%han@samsung.com>
References: <BLU185-W10713E955F9530C4D53490A6F70@phx.gbl>,
 <BLU185-W62B0858FCD7D3A71127B41A6F70@phx.gbl>,
 <002201cfa0ca$be634b10$3b29e130$%han@samsung.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "b32955@freescale.com" <b32955@freescale.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "christian.riesch@omicron.at" <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=
>> + if (cfi->cfiq->BufWriteTimeoutTyp &&=0A=
>> + cfi->cfiq->BufWriteTimeoutMax){=0A=
>> + cfi->chips[i].buffer_write_time_max =3D=0A=
>> + 1<<(cfi->cfiq->BufWriteTimeoutTyp +=0A=
>> + cfi->cfiq->BufWriteTimeoutMax)=3B=0A=
>> + } else {=0A=
>> + cfi->chips[i].buffer_write_time_max =3D 0=3B=0A=
>> + }=0A=
>=0A=
> Please keep the coding style as below.=0A=
>=0A=
> if ( ) {=0A=
> ...=0A=
> } else {=0A=
> ...=0A=
> }=0A=
>=0A=
=0A=
If I keep coding style as above.this will be beyond the requirements of one=
 line length.=0A=
I also saw othter files use the same code style as mine.please see:cfi_cmds=
et_0001.c=0A=
=0A=
if (cfi->cfiq->WordWriteTimeoutTyp &&=0A=
=A0 =A0 =A0cfi->cfiq->WordWriteTimeoutMax)=0A=
=A0 =A0 =A0 =A0 cfi->chips[i].word_write_time_max =3D=0A=
		1<<(cfi->cfiq->WordWriteTimeoutTyp +=0A=
		=A0 =A0 =A0=A0cfi->cfiq->WordWriteTimeoutMax)=3B=0A=
else=0A=
=A0 =A0 =A0 cfi->chips[i].word_write_time_max =3D 50000 * 8=3B=0A=
=0A=
Note: beacuse I cann't send mail by git in office=2CI send this patch by we=
b mail client.So=2C=0A=
there still a error stype in this patch(web mail client will remove some sp=
aces)=2Cthat is one space required before that '>=3D'.I will send again thi=
s patch at home.=0A=
For your=A0coding style advice=2C=A0I will take into account=2Cbut i don't =
know if can put one line. 		 	   		  =
