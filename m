Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaM10-00082w-C6
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 09:20:22 +0000
Message-ID: <534E4BA7.2040901@freescale.com>
Date: Wed, 16 Apr 2014 17:21:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: fix __iomem annotations
References: <1397638079-1894-1-git-send-email-computersforpeace@gmail.com>
 <534E4528.6030700@freescale.com>
 <20140416091512.GG5512@norris-Latitude-E6410>
In-Reply-To: <20140416091512.GG5512@norris-Latitude-E6410>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B404=E6=9C=8816=E6=97=A5 17:15, Brian Norris =E5=86=99=
=E9=81=93:
> Pushed to l2-mtd.git/spinor.
I think you can rebase patches in the spinor branch to the master branch=20
now.

After the rebase, we can add the patch for the *defconfig for the=20
linux-next.

thanks
Huang Shijie
