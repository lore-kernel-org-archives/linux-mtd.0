Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNnvS-0007Rk-9G
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 18:30:46 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Menon, Nishanth" <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>
Subject: RE: [PATCH v1 3/3] ARM: dts: am437x-gp-evm: add support for
 parallel NAND flash
Date: Wed, 12 Mar 2014 18:30:18 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB2D03@DBDE04.ent.ti.com>
References: <1394621360-2457-1-git-send-email-pekon@ti.com>
 <1394621360-2457-4-git-send-email-pekon@ti.com> <532071A2.5020400@ti.com>
In-Reply-To: <532071A2.5020400@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Menon, Nishanth
>>On 03/12/2014 05:49 AM, Pekon Gupta wrote:
>> Adds pinmux and DT node for Micron (MT29F4G08AB) x8 NAND device present =
on
>> am437x-gp-evm board.
>> (1) As NAND Flash data lines are muxed with eMMC, Thus at a given time e=
ither
>>     eMMC or NAND can be enabled. Selection between eMMC and NAND is cont=
rolled:
>>     (a) By dynamically driving following GPIO pin from software
>>         SPI2_CS0(GPIO) =3D=3D 0 NAND is selected (default)
>>         SPI2_CS0(GPIO) =3D=3D 1 eMMC is selected
>>     (b) By statically using Jumper (J89) on the board
>>
>> (2) As NAND device connnected to this board has page-size=3D4K and oob-s=
ize=3D224,
>>     So ROM code expects boot-loaders to be flashed in BCH16 ECC scheme f=
or
>>     NAND boot.
>>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> ---
>>  arch/arm/boot/dts/am437x-gp-evm.dts | 107 +++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 107 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am4=
37x-gp-evm.dts
>> index df8798e..0027ea7 100644
>> --- a/arch/arm/boot/dts/am437x-gp-evm.dts
>> +++ b/arch/arm/boot/dts/am437x-gp-evm.dts
>
>which branch does this apply on? I assume you mean this for Tony's
>omap-for-v3.15/dt branch? it would be nice if you'd make that clear in
>cover letter.
>
Sorry, I missed that. I'll keep a note of this next time.
Yes, this patch series is rebased on
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap omap-for-v3=
.15/dt


with regards, pekon
