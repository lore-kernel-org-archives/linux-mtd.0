Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qr3cP-0007Pv-OT
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2011 07:54:26 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 9/9] faq: general: add bug reporting FAQ
Date: Wed, 10 Aug 2011 09:54:11 +0200
References: <1312832239-21759-10-git-send-email-computersforpeace@gmail.com>
	<1312927531-16853-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312927531-16853-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108100954.11266.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 10 August 2011 00:05:31 Brian Norris wrote:
> It's surprising to note that we do not have a general "how to send a bug
> report" FAQ. This patch provides a starting point and (most importantly)
> directs UBI/UBIFS users to the appropriate bug reporting information.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v2: handle some of Brian Foster's suggestions regarding clarity, other
>     additions to FAQ entry
>=20
>  faq/general.xml |   64 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  mail.xml        |    4 ++-
>  2 files changed, 67 insertions(+), 1 deletions(-)
>=20
> diff --git a/faq/general.xml b/faq/general.xml
>[...]=20
> +	<LI>include information about flash parameters found from
> +	"<CODE>mtdinfo&amp;nbsp;-a</CODE>" (or the less useful info from
> +	"<CODE>cat&amp;nbsp;/proc/mtd</CODE>");</LI>

 =E2=80=98&amp;nbsp;=E2=80=99?  I assume that's because this appears to be
 XML which, I also assume, is translated(?) into (X)HTML ?
 (Just checking that that is intended/intentional.)
cheers!
	-blf-
=2D-=20
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
