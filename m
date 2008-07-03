Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KEI1K-0007uW-P2
	for linux-mtd@lists.infradead.org; Thu, 03 Jul 2008 06:10:19 +0000
Subject: Re: [PATCH] UBI: Fix 64-bit calculations
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF36E1E7E8.CDE063B0-ON8825747B.001AF00D-8825747B.001AFBD6@selinc.com>
References: <OF36E1E7E8.CDE063B0-ON8825747B.001AF00D-8825747B.001AFBD6@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 03 Jul 2008 09:07:14 +0300
Message-Id: <1215065234.6573.102.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-07-02 at 21:55 -0700, Bruce_Leonard@selinc.com wrote:
> Artem,
>=20
> I found another place where promotion was clobbering the 64-bit result.=20
> I'm attaching it rather than sending it inline because my mailer evidentl=
y=20
>=20
> has a problem with line wraps that I haven't figured out how to fix.=20
> Hopefully it comes through okay.  My apologies to the list.

Thanks for the patch - applied and pushed
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
