Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9KMY-0001BQ-3y
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 14:44:21 +0000
Received: by fxm8 with SMTP id 8so5497331fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 May 2009 07:44:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243431447.11172.27.camel@localhost.localdomain>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
	<1243323142.21646.129.camel@localhost.localdomain>
	<72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
	<1243331031.21646.134.camel@localhost.localdomain>
	<72795ccb0905260247p6c204cc4w78eaafd28ffc3cf8@mail.gmail.com>
	<72795ccb0905260321n3b4646brb9adc90425b5304b@mail.gmail.com>
	<72795ccb0905260455x701ea6e9u5bafc7c394609a4b@mail.gmail.com>
	<1243405314.11172.5.camel@localhost.localdomain>
	<72795ccb0905270300p7ac111fduba8d656a8031a96c@mail.gmail.com>
	<1243431447.11172.27.camel@localhost.localdomain>
Date: Wed, 27 May 2009 16:44:12 +0200
Message-ID: <72795ccb0905270744j1e991764ka03e8429f99a6ae0@mail.gmail.com>
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: simon polette <spolette@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/5/27 Artem Bityutskiy <dedekind@infradead.org>:
> On Wed, 2009-05-27 at 12:00 +0200, simon polette wrote:
>> Hoping the patch is correct now :
>
> Did you that test this driver with on-flash BBT? Does it
> work? Did you try marking/un-marking blocks bad? I'm just
> curious.
>
> I added your patch to my l2-mtd-2.6.git.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>

Yes I test it on a AT91SAM9261EK board and it work find, but I didn't
try to mark blocks as bad.

Best regards.
