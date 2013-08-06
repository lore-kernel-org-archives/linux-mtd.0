Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6eXB-0001O0-IJ
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 10:30:34 +0000
Message-ID: <1375785006.12043.1.camel@hornet>
Subject: Re: [PATCH v3 4/4] mtd: nand: gpio: Add support for multichip devices
From: Pawel Moll <pawel.moll@arm.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Tue, 06 Aug 2013 11:30:06 +0100
In-Reply-To: <1375779459-32549-2-git-send-email-shc_work@mail.ru>
References: <1375779459-32549-1-git-send-email-shc_work@mail.ru>
 <1375779459-32549-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ian Campbell <ian.campbell@citrix.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "rob.herring@calxeda.com" <rob.herring@calxeda.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-08-06 at 09:57 +0100, Alexander Shiyan wrote:
> This patch adds support for multichip NAND devices controlled through GPI=
Os.
> To implement this, the properties of tree have been renamed. All current
> boards and DTS files converted to use an updated driver. Also driver
> temporarily keep support for DTS files which use the previous names schem=
e.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt  |  16 +--
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts       |  10 +-
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts       |  10 +-

For the bindings part:

Acked-by: Pawel Moll <pawel.moll@arm.com>
