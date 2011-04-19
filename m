Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCC4X-00063V-Uf
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 14:38:34 +0000
Received: by ywf9 with SMTP id 9so1252656ywf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 07:38:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303223386.24954.21.camel@fs-test.research.nokia.com>
References: <1303195429.2779.2.camel@localhost>
	<971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTi=LuXGaRdiaKRz0RYb1Z3WWaT53ng@mail.gmail.com>
	<1303223386.24954.21.camel@fs-test.research.nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 19 Apr 2011 10:38:12 -0400
Message-ID: <BANLkTinVjqzz_f9waArqWZ=dmvCUC3H+KA@mail.gmail.com>
Subject: Re: [PATCHv3 1/3] mkfs.jffs2: fix casting of __off64_t
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 19, 2011 at 10:29, Andy Shevchenko wrote:
> On Tue, 2011-04-19 at 10:26 -0400, ext Mike Frysinger wrote:
>> On Tue, Apr 19, 2011 at 04:34, Andy Shevchenko wrote:
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("=
\ts %04o %9lu =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %5d:%-3d %s\n",
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("=
\ts %04o %" PRIu64 " =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %5d:%-3d %s\=
n",
>>
>> is there a reason for dropping the field width ? =C2=A0printf("%9"PRIu64=
"
>> .....") should work fine ...
>
> If you guarantee the value not higher than 10^10, why should we use
> PRIu64 at all? It's enough to have cast to unsigned long in such case.

it's a *minimum* field width, not a maximum.  it makes sure the output
is aligned properly for most people.
-mike
