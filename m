Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0XA5-0001Jd-6t
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 09:07:22 +0000
Received: by fxm28 with SMTP id 28so7735123fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Oct 2009 02:07:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256115095.29856.338.camel@localhost>
References: <1256114044-12163-3-git-send-email-akinobu.mita@gmail.com>
	<1256115095.29856.338.camel@localhost>
From: vimal singh <vimal.newwork@gmail.com>
Date: Wed, 21 Oct 2009 14:36:55 +0530
Message-ID: <ce9ab5790910210206y5a5fda40vccf4162382b09841@mail.gmail.com>
Subject: Re: [PATCH 3/3 -v3] MTD: Add nand_ecc test module
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 21, 2009 at 2:21 PM, Artem Bityutskiy
<Artem.Bityutskiy@nokia.com> wrote:
> On Wed, 2009-10-21 at 17:34 +0900, Akinobu Mita wrote:
>> This module tests NAND ECC functions.
>>
>> The test is simple.
>>
>> 1. Create a 256 or 512 bytes block of data filled with random bytes (dat=
a)
>> 2. Duplicate the data block and inject single bit error (error_data)
>> 3. Try to correct error_data
>> 4. Compare data and error_data
>>
>> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>> Cc: vimal singh <vimal.newwork@gmail.com>
>> ---
>> =C2=A0drivers/mtd/tests/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A01 +
>> =C2=A0drivers/mtd/tests/nand_ecc-test.c | =C2=A0 87 ++++++++++++++++++++=
+++++++++++++++++
>> =C2=A02 files changed, 88 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 drivers/mtd/tests/nand_ecc-test.c
>
> How about a consistent name for the test? All current tests have 'mtd_'
> prefix. How about make the file to be 'mtd_ecctest.c' ?

Or 'mtd_nandecctest.c'..? Since, anyways, this test is only for nand.

--=20
Regards,
Vimal Singh

>
> Also, since you anyway need to use these "#defines", I think there is
> not need to use this splitting. I apologize for leading you that way at
> the beginning.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
