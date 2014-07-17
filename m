Received: from blu004-omc2s4.hotmail.com ([65.55.111.79])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Zy3-0004G3-73
 for linux-mtd@lists.infradead.org; Thu, 17 Jul 2014 00:54:39 +0000
Message-ID: <BLU185-W53748517956B27745D7033A6F40@phx.gbl>
From: Bean Huo <beanhuo@outlook.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v6] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Thu, 17 Jul 2014 00:54:17 +0000
In-Reply-To: <20140716180423.GV7537@ld-irv-0074>
References: <BLU436-SMTP223B6F83933407357F0FF3BA6F70@phx.gbl>,
 <20140716180423.GV7537@ld-irv-0074>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.riesch@omicron.at" <christian.riesch@omicron.at>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=
=0A=
=0A=
> Hi Bean=2C=0A=
=0A=
>> + cfi->chips[i].buffer_write_time_max =3D=0A=
>> + ((cfi->chips[i].buffer_write_time_max>=3D 2000)=0A=
>> + ? cfi->chips[i].buffer_write_time_max : 2000)=3B=0A=
>=0A=
> This should just use the 'max()' macro=2C from <linux/kernel.h>.=0A=
=0A=
> I have just fixed up your patch myself=2C to use max() and to improve som=
e=0A=
> of the language. Let me know if the below works for you.=0A=
=0A=
hi=2CBrian=0A=
=A0Thanks once again.I test and it works Ok.It can be accepted now? 		 	   =
		  =
