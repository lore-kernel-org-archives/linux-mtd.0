Received: from mail-gx0-f208.google.com ([209.85.217.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lssi2-0007wK-GB
	for linux-mtd@lists.infradead.org; Sun, 12 Apr 2009 05:58:33 +0000
Received: by gxk4 with SMTP id 4so3823136gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Apr 2009 22:58:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1239093559-12043-1-git-send-email-sr@denx.de>
References: <1239093559-12043-1-git-send-email-sr@denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 11 Apr 2009 23:58:09 -0600
Message-ID: <fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
Subject: Re: [PATCH 1/4 v2] mtd: physmap_of: Add multiple regions and
	concatenation support
To: Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 7, 2009 at 2:39 AM, Stefan Roese <sr@denx.de> wrote:
> This patch adds support to handle multiple non-identical chips in one
> flash device tree node. It also adds concat support to physmap_of. This
> makes it possible to support e.g. the Intel P30 48F4400 chips which
> internally consists of 2 non-identical NOR chips on one die. Additionally
> partitions now can span over multiple chips.
>
[...]
> Signed-off-by: Stefan Roese <sr@denx.de>
> CC: Grant Likely <grant.likely@secretlab.ca>

Looks good to me.  To comments below, but neither are enough to hold back m=
y:

Reviewd-by: Grant Likely <grant.likely@secretlab.ca>

However, I have not tested this.  I'd like to hear of some larger
field testing before it is merged.

g.

> + =A0 =A0 =A0 reg_tuple_size =3D (of_n_addr_cells(dp) + of_n_size_cells(d=
p)) * 4;

Ideally s/4/sizeof(u32)/, but not a huge deal.

> + =A0 =A0 =A0 info =3D kzalloc(sizeof(struct of_flash) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct of_flash_list)=
 * count, GFP_KERNEL);
> + =A0 =A0 =A0 if (!info)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_out;
> +
> + =A0 =A0 =A0 mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP_K=
ERNEL);

Typically I prefer to see a single kzalloc in a driver which allocates
all the space needed in one go because it simplifies the error/unwind
path.

Cheers,
g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
