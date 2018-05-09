Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGOwL-0002Lu-BI
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 13:16:00 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [PATCH] mtd: cfi_cmdset_0002: Change erase functions to retry for
 error
Date: Wed, 9 May 2018 13:15:12 +0000
Message-ID: <TY1PR01MB09545455063CD0D276BF9756DC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508132037.152cc581@bbrezillon>
 <TY1PR01MB095425A96233A864806D0635DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508191144.5d8412b6@bbrezillon>
 <d0371e65130a1d64b66031d3f1ed73707ce3f079.camel@infinera.com>
 <TY1PR01MB09546705E1858D6924243F0ADC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <TY1PR01MB0954B6574DFF6E51E48C1F8DDC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180509134512.522be701@bbrezillon>
In-Reply-To: <20180509134512.522be701@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris-san,

Thank you so much for the comments.

> Sorry, but until you've figured out what was going on here, I'm
> reluctant to apply this patch. Are you even sure it fixes the problem
> you had? Hard to tell since you're not able to reproduce the issue.

  Okay I will do retry to reproduce the issue again.
  But probably it may take a little time to reproduce the issue.

> You renamed it MAX_RETRY in a previous patch. Better send patches in
> the same patch series when there are dependencies.

  I see about this.

By the way mainly I would like to fix the patch below for the write error i=
ssue.
  <http://lists.infradead.org/pipermail/linux-mtd/2018-May/080794.html>

The sender address of patch is not good so I will do send the patch again.
So please review the patch also later.

Regards,
Ikegami
