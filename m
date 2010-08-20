Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmIIS-0001Ni-Pz
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 03:29:37 +0000
Received: by vws11 with SMTP id 11so2797520vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2010 20:29:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4C6DAFFD.4040602@broadcom.com>
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com>
	<20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
Date: Thu, 19 Aug 2010 20:29:35 -0700
Message-ID: <AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
From: Kevin Cernekee <cernekee@gmail.com>
To: Brian Norris <norris@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Tilman Sauerbeck <tilman@code-monkey.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 19, 2010 at 3:28 PM, Brian Norris <norris@broadcom.com> wrote:
> On 08/19/2010 12:46 PM, Kevin Cernekee wrote:
>> The code is right; the comment is wrong.
>
> In that case, should we fix the comment and add the
> check that Tilman mentioned previously? (below)

To clarify - the comment in the code is correct, but the checkin
comment was inaccurate.

>> @@ -2852,6 +2852,7 @@ static struct nand_flash_dev *nand_get_flash_type(=
struct mtd_info *mtd,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id_data[0] =
=3D=3D id_data[6] && id_data[1] =3D=3D id_data[7] &&
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id_data[0] =3D=3D NAND_MFR_SAMSUN=
G &&
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (chip->cellinfo & NAND_CI_CELLTYPE_MSK) =
&&
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id_data[5] !=3D 0x00) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Calc pagesize */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mtd->writesize =3D 2048 << (extid & 0x03);

This looks OK (at least for K9GAG08U0D).

I wonder if Samsung could provide some firm guidelines for when to use
the old style vs. the new style.
