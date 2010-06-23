Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORFQw-0008LY-J6
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 02:11:23 +0000
Received: by gxk22 with SMTP id 22so2978580gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jun 2010 19:11:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100623002334.GA22367@shareable.org>
References: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
	<1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
	<AANLkTilBFi58-kjjxM2Q5p0I1l9R5WQpiozBiV5udQYW@mail.gmail.com>
	<20100623002334.GA22367@shareable.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 22 Jun 2010 22:11:01 -0400
Message-ID: <AANLkTimllsVj3nGC7vWP9oKPJXwIyjd71y0KbA7rFhPH@mail.gmail.com>
Subject: Re: [PATCH 2/3] flash_eraseall: move constants out of for loop
To: Jamie Lokier <jamie@shareable.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, "Shevchenko Andriy \(EXT-Teleca/Helsinki\)"
	<ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 22, 2010 at 20:23, Jamie Lokier wrote:
> Mike Frysinger wrote:
>> i wonder though why this code even bothers with "static".
>
> The array is static to avoid compiling to code which fills in the
> array at runtime. =C2=A0I.e. it makes the code smaller, to the same size =
as
> if they were globals. =C2=A0And then, only because its static, the const
> can put them in the .rodata section, reducing unshared data size.

if it were generated on the stack at runtime, the .text is shared too

> Because they're static there's no benefit to moving them to another
> scope.

that's sort of what i expected, but i found it odd that it isnt:
    static const char * const short_options =3D "jq";
-mike
