Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1djAWS-0006C8-Nm
 for linux-mtd@lists.infradead.org; Sat, 19 Aug 2017 20:39:11 +0000
Date: Sat, 19 Aug 2017 22:38:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>, Sricharan R <sricharan@codeaurora.org>,
 Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v5 11/16] mtd: nand: qcom: support for command
 descriptor formation
Message-ID: <20170819223844.6068e615@bbrezillon>
In-Reply-To: <a14f38a2391be690474271933611d8a8@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
 <1502971674-13810-11-git-send-email-absahu@codeaurora.org>
 <a14f38a2391be690474271933611d8a8@codeaurora.org>
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

Le Sat, 19 Aug 2017 15:17:13 +0530,
Abhishek Sahu <absahu@codeaurora.org> a =C3=A9crit :

> On 2017-08-17 17:37, Abhishek Sahu wrote:
> > 1. Add the function for command descriptor preparation which will
> >    be used only by BAM DMA and it will form the DMA descriptors
> >    containing command elements
> > 2. DMA_PREP_CMD flag should be used for forming command DMA
> >    descriptors
> >=20
> > Reviewed-by: Archit Taneja <architt@codeaurora.org>
> > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > ---
> >=20
> > * Changes from v4: None
> >=20
> > * BUILD DEPENDENCY:
> >=20
> >  This PATCH has build dependency over following BAM command descriptor
> >  patch posted in DMA engine mailing list
> >=20
> >  http://www.spinics.net/lists/dmaengine/msg13665.html
> >  =20
>=20
>   Hi Boris,
>=20
>   These patch has build dependency over DMA engine patch
>   http://www.spinics.net/lists/dmaengine/msg13665.html
>=20
>   but this patch has been applied in your github
>   https://github.com/bbrezillon/linux-0day/commits/nand/next
>=20
>   The DMA change has not merged yet so could we drop this and
>   previous patch alone till the the DMA change is merged to prevent
>   build error.

Oops. I saw this note when reviewing previous version of this and
completely forgot when applying v5. I dropped it from my nand/next
branch.
;
Note that the linux-0day repo is just a personal repo I use to let
Fenguang's robots test things before I push then to l2-mtd/nand/next.

Anyway, thanks for the heads up.

Boris
