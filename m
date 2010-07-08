Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWo4X-0005mG-KB
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 10:11:14 +0000
Received: by pvf33 with SMTP id 33so307640pvf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Jul 2010 03:11:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1278583087.20321.0.camel@localhost>
References: <u2v70c9a9111004300305n4c86774bm7ed70161ad72d830@mail.gmail.com>
	<z2p9c9fda241005052046j3fea69a4v91f3d5fd86648fac@mail.gmail.com>
	<k2x70c9a9111005060422v90e246daw19b1f71d57a890a1@mail.gmail.com>
	<g2x9c9fda241005060444x7f9c4360u334d3afb06f1e8b8@mail.gmail.com>
	<z2v70c9a9111005060602n7b7477ebueb197af05372bd5@mail.gmail.com>
	<AANLkTimwO5iU6zPUJeLwAxW3GZGz5ldSRLmp2vpTBem3@mail.gmail.com>
	<AANLkTiktbqSHHw572y1YGVw7XhZaim9Pg3lhoMmDBLXY@mail.gmail.com>
	<AANLkTin43tv-AiFjwNkUE7ijy_ADMtsZTrqo_PY3DpCE@mail.gmail.com>
	<1278583087.20321.0.camel@localhost>
Date: Thu, 8 Jul 2010 12:11:11 +0200
Message-ID: <AANLkTiludbDD8ndnQlqxyWeP7us-BxaEDHvKfDpw-AW8@mail.gmail.com>
Subject: Re: Possible bug in onenand_base ?
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
	Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

2010/7/8 Artem Bityutskiy <dedekind1@gmail.com>:
> On Thu, 2010-07-08 at 11:55 +0200, Enric Balletb=C3=B2 i Serra wrote:
>> Hello,
>>
>> I made new tests regarding this issue. Looks like the problem is
>> reading from the OneNAND device.
>
> Did you try older kernel and then bisecting who is responsible for the
> breakage?

Yes, before commit

5988af2319781bc8e0ce418affec4e09cfa77907 (mtd: Flex-OneNAND support)

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
it;h=3D5988af2319781bc8e0ce418affec4e09cfa77907

my  OneNAND is working, after the commit, the OneNAND support is broken.

Cheers,
Enric

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
