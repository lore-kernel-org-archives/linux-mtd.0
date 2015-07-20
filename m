From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 4/7] Documentation: mtd: add a DT property to set the
 latency code of Spansion memory
Date: Mon, 20 Jul 2015 21:29:41 +0200
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, shijie.huang@intel.com,
 ben@decadent.org.uk, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1437059658.git.cyrille.pitchen@atmel.com>
 <201507161944.20523.marex@denx.de> <55ACBE1B.6050507@atmel.com>
In-Reply-To: <55ACBE1B.6050507@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201507202129.42105.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, July 20, 2015 at 11:23:39 AM, Cyrille Pitchen wrote:
> Hi Marek,

Hi!

> Le 16/07/2015 19:44, Marek Vasut a =E9crit :
> > On Thursday, July 16, 2015 at 05:27:51 PM, Cyrille Pitchen wrote:
> >=20
> > Hi!
> >=20
> >> Both the SPI controller and the NOR flash memory need to agree on the
> >> number of dummy cycles to use for Fast Read commands. For Spansion
> >> memories, this number of dummy cycles is not given directly but through
> >> a so called "latency code".
> >> The latency code can be found into the memory datasheet and depends on
> >> the SPI clock frequency, the Fast Read op code and the Single/Dual Data
> >> Rate mode.
> >=20
> > Shouldn't you be able to derive the latency code from the above
> > information, which you already know then ?
>=20
> Yes I agree with you; this could have been done adding static tables insi=
de
> the driver instead of creating a new DT property dedicated to Spansion
> memories.

OK, I see now. The latency code can not be calculed from "SPI clock frequen=
cy,=20
the Fast Read op code and the Single/Dual Data Rate mode" easily, you need =
to
index into some table to obtain some ad-hoc value. Got it. Sorry for the no=
ise!

> When I wrote this patch, I had a close look at the s25fl512s datasheet but
> only overviewed few datasheets for other Spansion QSPI flash memories. So
> I don't know whether a single latency code table could be shared among all
> Spansion memories or many tables should be added to support different
> memory models.
>=20
> That's why I've chosen to add a dedicated DT property to support Spansion
> memories as it avoids to add tables to guess the proper latency code to be
> used. I thought it would be more flexible.
>=20
> Maybe I will remove the support of Spansion QSPI memories from this series
> for now. Their support can still be implemented later.
>=20
> Anyway, thanks for your review :)

Let's wait for more comments :)

Best regards,
Marek Vasut
