Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC83u-000478-V3
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 10:21:40 +0000
Received: by qyl38 with SMTP id 38so4250873qyl.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 03:21:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303207320.2779.9.camel@localhost>
References: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
	<1301900656.2760.6.camel@localhost>
	<BANLkTi=WTWa4yj+ysta8jiHs9r4MX5Gf_g@mail.gmail.com>
	<1301911604.2760.52.camel@localhost>
	<BANLkTi=DHTjL7M9bzYY-t5MJS2s1WScBCQ@mail.gmail.com>
	<BANLkTinysw90tiWhFRmQH_0LWx7o+sD1-A@mail.gmail.com>
	<1303207320.2779.9.camel@localhost>
Date: Tue, 19 Apr 2011 12:21:36 +0200
Message-ID: <BANLkTinyp9Ne_OBPf+ejERjAPeUUxga2cQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Use empty_iops and empty_fops consistently
From: Sedat Dilek <sedat.dilek@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jens Axboe <jaxboe@fusionio.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: sedat.dilek@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 19, 2011 at 12:02 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Tue, 2011-04-19 at 11:50 +0200, Sedat Dilek wrote:
>> can you take this patch into your UBIFS tree?
>> Thanks in advance.
>
> Sorry, forgot about this patch. Pushed to ubifs-2.6.git tree, but I
> re-wrote the commit message because I found yours a bit confusing. Is
> this OK?
>

Thanks.
Nice wording, fire it up :-).

> http://git.infradead.org/ubifs-2.6.git/commit/8c355ad269c9da635fad8367e9a=
6d52bf3fe08c8
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
