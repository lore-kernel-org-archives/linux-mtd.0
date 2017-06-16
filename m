Received: from smtp1-2.goneo.de ([85.220.129.31] helo=smtp1.goneo.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLrxm-0007bV-Jw
 for linux-mtd@lists.infradead.org; Fri, 16 Jun 2017 14:11:04 +0000
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
From: Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <20170518200140.11982b12@vento.lan>
Date: Fri, 16 Jun 2017 16:03:23 +0200
Cc: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "linux-kernel@vger.kernel.org org List" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net> <20170518200140.11982b12@vento.lan>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Jani Nikula <jani.nikula@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Am 19.05.2017 um 01:01 schrieb Mauro Carvalho Chehab =
<mchehab@s-opensource.com>:
>=20
> Em Thu, 18 May 2017 11:26:08 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>=20
>> On Tue, 16 May 2017 09:15:52 -0300
>> Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:
>>=20
>>> This patch series convert the remaining DocBooks to ReST.
>>=20
>> Gotta love this:
>>=20
>>> 124 files changed, 7469 insertions(+), 10511 deletions(-)
>=20
> Heh, yeah, lots of stuff changed :-)

Hi Mauro,

I guess there are little remains lying around ;) what I have found:

DocBook stuff

./scripts/kernel-doc-xml-ref

docproc and some lines in the Makefile & .gitignore

./scripts/docproc.c
./scripts/.docproc.cmd
./scripts/Makefile
./scripts/.gitignore

Do we need the following any longer?=20

./Documentation/sphinx/convert_template.sed
./Documentation/sphinx/post_convert.sed

If you have time for, can you take a look at this?

Thanks!

=E2=80=94 Markus =E2=80=94=
