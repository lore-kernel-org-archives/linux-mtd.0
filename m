Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtiCK-0001RA-Rn
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 12:57:15 +0000
From: Stefan Roese <sr@denx.de>
To: devicetree-discuss@ozlabs.org
Subject: Re: [PATCH 1/4 v2] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Tue, 14 Apr 2009 14:57:06 +0200
References: <1239093559-12043-1-git-send-email-sr@denx.de>
	<fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
In-Reply-To: <fa686aa40904112258n1cc23b48t80b135b7016e9760@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200904141457.06664.sr@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 12 April 2009, Grant Likely wrote:
> > + =A0 =A0 =A0 info =3D kzalloc(sizeof(struct of_flash) +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct of_flash_lis=
t) * count, GFP_KERNEL);
> > + =A0 =A0 =A0 if (!info)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_out;
> > +
> > + =A0 =A0 =A0 mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP=
_KERNEL);
>
> Typically I prefer to see a single kzalloc in a driver which allocates
> all the space needed in one go because it simplifies the error/unwind
> path.

In general ack, but it doesn't make much sense in this case. The 2nd malloc=
 is=20
for an temporary buffer needed for mtd_concat_create() call (list of struct=
=20
mtd_info. I can't really combine those two areas. So I'll leave this=20
untouched.

Best regards,
Stefan
