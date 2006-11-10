Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GiZEE-0007hf-VJ
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 11:27:49 -0500
Subject: Re: mount costs too long
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <4554A592.5000308@ru.mvista.com>
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
	<1163159781.19697.24.camel@crusty.rchland.ibm.com>
	<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
	<1163174898.3925.13.camel@sauron>  <4554A592.5000308@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 10 Nov 2006 18:26:40 +0200
Message-Id: <1163176000.3925.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Aubrey <aubreylee@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-10 at 19:15 +0300, Vitaly Wool wrote:
> This is more a yaffs1 problem rather than MTD's. The thing is that
> yaffs1 blindly presumes SmartMedia OOB layout which is untrue for most
> flashes, so an additional translation was implemented within yaffs1.
>=20
But Aubrey said it is 2.6.18-only, why?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
