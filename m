Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [LINUX RFC v2 1/4] spi: add support of two chip selects & data
 stripe
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <20150903121232.GW12027@sirena.org.uk>
Date: Fri, 4 Sep 2015 14:35:52 +0200
Cc: Ranjit Waghmode <ranjit.waghmode@xilinx.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, michal.simek@xilinx.com,
 soren.brinkmann@xilinx.com, zajec5@gmail.com, ben@decadent.org.uk,
 marex@denx.de, b32955@freescale.com, knut.wohlrab@de.bosch.com,
 juhosg@openwrt.org, beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, harinik@xilinx.com,
 punnaia@xilinx.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4C1DE94-773C-498F-9CD5-639FBEEE3139@sperl.org>
References: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1440570367-22569-2-git-send-email-ranjit.waghmode@xilinx.com>
 <20150903121232.GW12027@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 03.09.2015, at 14:12, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Wed, Aug 26, 2015 at 11:56:04AM +0530, Ranjit Waghmode wrote:
>=20
>> To support dual parallel mode operation of ZynqMP GQSPI controller
>> following API's are added inside the core:
>=20
> As covered in SubmittingPatches please try to make each patch a single
> change rather than having multiple separate changes in one commit.
>=20
>> +	/* Controller may support more than one chip.
>> +	 * This flag will enable that feature.
>> +	 */
>> +#define SPI_MASTER_BOTH_CS		BIT(8)		/* enable both =
chips */
>=20
> This isn't saying that the controller supports more than one chip, =
it's
> saying that the controller supports asserting more than one chip =
select
> at once which isn't the same thing.  I'm also not entirely sure that
> this makes sense as a separate feature to the data striping one - I'm
> struggling to think of a way to use this sensibly separately to that.

Well - there is one use-case that I can think of:
fbtft has the requirement for some devices to control a GPIO to
differentiate between command and data getting transferred
- sort of 9 bit.

Right now it is done outside of spi in the fbtft driver itself wrapping
spi_sync().

Similarly a =E2=80=9Chold=E2=80=9D line on an eeprom or similar could =
get (de)asserted
without requiring holding a spi-bus-lock.

But then the current patch would not allow this kind of =E2=80=9Cgeneric=E2=
=80=9D
use-case.

Martin
