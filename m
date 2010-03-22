Received: from mail-yx0-f194.google.com ([209.85.210.194])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NtaNY-00079q-PM
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2010 05:40:49 +0000
Received: by yxe32 with SMTP id 32so2623229yxe.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 Mar 2010 22:40:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1265089697.2517.12.camel@localhost.localdomain>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
	<1265089697.2517.12.camel@localhost.localdomain>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 22 Mar 2010 13:40:23 +0800
Message-ID: <3c17e3571003212240y6909e0f7paa52b1bc0cd6e721@mail.gmail.com>
Subject: Re: [PATCH 1/2] let MTD_XIP depend on XIP_KERNEL or ROMKERNEL
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 2, 2010 at 1:48 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Fri, 2010-01-15 at 15:50 +0800, Barry Song wrote:
>> Some architectures like blackfin,h8300,m68k use ROMKERNEL to describe
>> kernel XIP, not like arm which uses XIP_KERNEL
>>
>> Signed-off-by: Barry Song <21cnbao@gmail.com>
>
> I've pushed these 2 patches to my l2-mtd-2.6 / dunno

Will they be merged into mainline? I have found them in Linus's tree yet.

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
