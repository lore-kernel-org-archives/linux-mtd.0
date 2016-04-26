Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxWs-0007HX-OW
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:35:32 +0000
Date: Tue, 26 Apr 2016 09:34:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel
 Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala
 <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 2/3] Documentation: devicetree: deprecate "soft_bch"
 nand-ecc-mode value
Message-ID: <20160426093459.207c2498@bbrezillon>
In-Reply-To: <1461324197-1333-2-git-send-email-zajec5@gmail.com>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
 <1461324197-1333-2-git-send-email-zajec5@gmail.com>
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

On Fri, 22 Apr 2016 13:23:14 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Now that we support nand-ecc-algo property it should be used together
> with "soft" to specify software BCH ECC.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Boris
--=20
Boris Brezillon, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
