Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCBtb-0005rd-M8
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 14:27:16 +0000
Received: by yxh35 with SMTP id 35so2286347yxh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 07:27:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <158e520ae5748a6e32eeefad99dea0395dd4c2a7.1303202005.git.ext-andriy.shevchenko@nokia.com>
References: <1303195429.2779.2.camel@localhost>
	<971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<82d06f0b9f3ad538d5a8dabfce6ac8337e07b0ae.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<158e520ae5748a6e32eeefad99dea0395dd4c2a7.1303202005.git.ext-andriy.shevchenko@nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 19 Apr 2011 10:26:53 -0400
Message-ID: <BANLkTikxr_RWMVTVo-JYCwDhBR_sJdp=Cw@mail.gmail.com>
Subject: Re: [PATCHv3 3/3] serve_image: adjust classifier and type for printf
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

On Tue, Apr 19, 2011 at 04:34, Andy Shevchenko wrote:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Image=
 size %ld bytes is not a multiple of erasesize %d bytes\n",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 st.st_size, erasesize);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Image=
 size %" PRIu64 " bytes is not a multiple of "
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "erasesize %d bytes\n", st.st_size, eras=
esize);

i think we want to avoid splitting string constants
-mike
