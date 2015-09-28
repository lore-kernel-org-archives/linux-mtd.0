Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgWVs-00013J-Mz
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 11:22:33 +0000
Date: Mon, 28 Sep 2015 13:21:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com"
 <guz.fnst@cn.fujitsu.com>, "gsi@denx.de" <gsi@denx.de>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frank Liu
 =?UTF-8?B?5YiY576k?= (frankliu)" <frankliu@micron.com>, Andrea Scian
 <rnd4@dave-tech.it>, "Peter Pan =?UTF-8?B?5r2Y5p+P5a6P?= (peterpan)"
 <peterpan@micron.com>, "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)"
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] fs:ubifs: add hook for UBI bakvol in ubifs layer
Message-ID: <20150928132159.4738f573@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CEE8@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEE8@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 Sep 2015 07:02:52 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> Add hook for UBI bakvol in ubifs layer.
>=20
> open/close bakvol operation in ubifs mount.
>=20
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  fs/ubifs/super.c | 6 ++++++
>  fs/ubifs/ubifs.h | 1 +
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 9547a278..f3bf548 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1463,6 +1463,8 @@ static int mount_ubifs(struct ubifs_info *c)
>  	dbg_gen("max. seq. number:    %llu", c->max_sqnum);
>  	dbg_gen("commit number:       %llu", c->cmt_no);
> =20
> +	init_bakvol(c->ubi, 1);

This function is implemented in patch 9 and you're using it here, which
means your series is not bisectable.

Also, do we really want to let UBIFS decide whether this feature should
be enabled or not for the whole UBI device?

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
