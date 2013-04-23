Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUVkz-0007wv-4O
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 05:27:09 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Michal Przeplata <michal.przeplata@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: corrupted empty space - again
Date: Tue, 23 Apr 2013 05:27:03 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9BC9BB@DBDE04.ent.ti.com>
References: <CADX2ZXMgE_Zfj157vgymj0K4MmHddCYqrj=qDUYLmcWj_kk7WQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9BB98F@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9BB98F@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed a typo
=20
> > It seems that:
> > a) error is of single bit-flip kind (read decay) (I don't suspect curre=
ntly
> >     unstable bits issue during erasing/writting)
> > b) our NAND driver doesn't protect our empty space (no wonder, as 13
> > bytes ECC used
> >     per 512B subpage should be left 0xFF until written with real data)
>=20
[Pekon]: This should not matter, suppose you wanted to write
0x77 to a erase-page byte already having a bit-flip at bit-0.=20
So in actual 0x76 would be written on the device. And corresponding=20
calculated ECC gets stored in OOB/spare area.

Now when you read the byte, it would read as 0x76, but ECC stored in
spare/OOB area was calculated for 0x77, so nand-driver would detect a
bit-flip and should correct it too.
So whether bit-flips occur on erased-page or whether after writing,
both can be detected and corrected by your driver.
