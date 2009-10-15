Received: from mail-gx0-f222.google.com ([209.85.217.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MyK2u-0008O7-A5
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 06:42:50 +0000
Received: by gxk22 with SMTP id 22so674190gxk.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Oct 2009 23:42:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1255588590.32489.209.camel@localhost>
References: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
	<1255268381.16942.74.camel@localhost>
	<20091013095836.GA3166@localhost.localdomain>
	<1255534912.32489.172.camel@localhost>
	<ce9ab5790910142205u41f6baf3v570515eec116edb3@mail.gmail.com>
	<1255588590.32489.209.camel@localhost>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 15 Oct 2009 12:12:21 +0530
Message-ID: <ce9ab5790910142342h20e459e5oa89675dc172488b2@mail.gmail.com>
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

On Thu, Oct 15, 2009 at 12:06 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Thu, 2009-10-15 at 10:35 +0530, vimal singh wrote:
>> On Wed, Oct 14, 2009 at 9:11 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > On Tue, 2009-10-13 at 18:58 +0900, Akinobu Mita wrote:
>> >> > This should not be needed. MTD tests are always compiled as modules=
,
>> >> > so you should not have copilation errors. And if MTD NAND support i=
s
>> >> > not present, modprobe will just fail.
>> >>
>> >> nand_calculate_ecc and nand_correct_data needs CONFIG_MTD_NAND=3Dy|m,
>> >> otherwise it will get link error:
>> >>
>> >> ERROR: "__nand_correct_data" [drivers/mtd/tests/nand_ecc-test.ko] und=
efined!
>> >> ERROR: "__nand_calculate_ecc" [drivers/mtd/tests/nand_ecc-test.ko] un=
defined!
>> >
>> > How about splitting tests on 2 parts - one part which does not require
>> > NAND, and one which does, and make the second part compile only if NAN=
D
>> > is enabled ("depends" operator in Kconfig) ?
>>
>> I thought purpose of this test was to test correctness of
>> 'nand_calculate_ecc' and 'nand_correct_data' functions (i.e. algos),
>> which are only compiled and available when NAND is enabled.
>
> That is exactly what I meant as well.

Then, what do you meant to test in first part of test. Sorry if I am
misinterpreting you statement above.

--=20
Regards,
Vimal Singh

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
