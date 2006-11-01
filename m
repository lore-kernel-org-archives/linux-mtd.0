Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfHH9-0007oX-HD
	for linux-mtd@lists.infradead.org; Wed, 01 Nov 2006 09:41:13 -0500
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20061030145105.84f953e7.vwool@ru.mvista.com>
References: <20061030145105.84f953e7.vwool@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 01 Nov 2006 16:41:02 +0200
Message-Id: <1162392062.7527.11.camel@sauron>
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

Hello Vitaly,

the patch looks logical for me, please find my comments below.

1. You did not change comments above the 'struct mtd_oob_ops' structure
declaration.

On Mon, 2006-10-30 at 14:51 +0300, Vitaly Wool wrote:
>  		if (devops.datbuf)
>  			devops.datbuf +=3D devops.retlen;
>  		if (devops.oobbuf)
> -			devops.oobbuf +=3D devops.ooblen;
> +			devops.oobbuf +=3D subdev->oobsize;

Is this is an independent bug-fix?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
