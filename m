Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MyIWz-0001Pn-Mb
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 05:05:45 +0000
Received: by yxe5 with SMTP id 5so579421yxe.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Oct 2009 22:05:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1255534912.32489.172.camel@localhost>
References: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
	<1255268381.16942.74.camel@localhost>
	<20091013095836.GA3166@localhost.localdomain>
	<1255534912.32489.172.camel@localhost>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 15 Oct 2009 10:35:20 +0530
Message-ID: <ce9ab5790910142205u41f6baf3v570515eec116edb3@mail.gmail.com>
Subject: Re: [PATCH] MTD: Add nand_ecc test module
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 14, 2009 at 9:11 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2009-10-13 at 18:58 +0900, Akinobu Mita wrote:
>> > This should not be needed. MTD tests are always compiled as modules,
>> > so you should not have copilation errors. And if MTD NAND support is
>> > not present, modprobe will just fail.
>>
>> nand_calculate_ecc and nand_correct_data needs CONFIG_MTD_NAND=3Dy|m,
>> otherwise it will get link error:
>>
>> ERROR: "__nand_correct_data" [drivers/mtd/tests/nand_ecc-test.ko] undefi=
ned!
>> ERROR: "__nand_calculate_ecc" [drivers/mtd/tests/nand_ecc-test.ko] undef=
ined!
>
> How about splitting tests on 2 parts - one part which does not require
> NAND, and one which does, and make the second part compile only if NAND
> is enabled ("depends" operator in Kconfig) ?

I thought purpose of this test was to test correctness of
'nand_calculate_ecc' and 'nand_correct_data' functions (i.e. algos),
which are only compiled and available when NAND is enabled.

-vimal

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
