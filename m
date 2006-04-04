Received: from uproxy.gmail.com ([66.249.92.193])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQaY6-0003lM-KR
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 21:41:46 -0400
Received: by uproxy.gmail.com with SMTP id j3so660491ugf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Apr 2006 18:41:36 -0700 (PDT)
Message-ID: <625fc13d0604031841q5eefc827m645b61f36516102d@mail.gmail.com>
Date: Mon, 3 Apr 2006 20:41:36 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060403130619.GA7659@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
	<Pine.LNX.4.64.0603311221070.14923@localhost.localdomain>
	<20060403130619.GA7659@wohnheim.fh-wedel.de>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>, Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/3/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> As a step in that direction, please take a look at this patchset:
> http://wh.fh-wedel.de/~joern/mtd_type.tgzwh.fh-wedel.de/~joern/mtd_type.t=
gz
>
> It removes all types except MTD_ABSENT and all flags but MTD_OOB.  As
> a replacement, three new flags are introduced.  So now we're at a
> total of 4 flags (previously 9) and two types (previously 9).

Can we pull this out into a different thread.  I almost lost it
because I have long sinced stopped caring about the stripping subject
until others come to some form of consensus :).

josh
