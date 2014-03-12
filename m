Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNnsF-0007Hj-DC
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 18:27:28 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Menon, Nishanth" <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>
Subject: RE: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for
 beaglebone NAND cape
Date: Wed, 12 Mar 2014 18:26:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB2CF1@DBDE04.ent.ti.com>
References: <1394621360-2457-1-git-send-email-pekon@ti.com>
 <1394621360-2457-2-git-send-email-pekon@ti.com> <532070C8.1030903@ti.com>
In-Reply-To: <532070C8.1030903@ti.com>
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

Hi,

>From: Menon, Nishanth
>>On 03/12/2014 05:49 AM, Pekon Gupta wrote:
>> Beaglebone Board can be connected to expansion boards to add devices to =
them.
>> These expansion boards are called 'capes'. This patch adds support for
>> following versions of Beaglebone(AM335x) NAND capes
>> (a) NAND Device with bus-width=3D16, block-size=3D128k, page-size=3D2k, =
oob-size=3D64
>> (b) NAND Device with bus-width=3D16, block-size=3D256k, page-size=3D4k, =
oob-size=3D224
>> Further information and datasheets can be found at [1] and [2]
[...]
>> [1] http://beagleboardtoys.info/index.php?title=3DBeagleBone_Memory_Expa=
nsion
>> [2] http://beagleboardtoys.info/index.php?title=3DBeagleBone_4Gb_16-Bit_=
NAND_Module
>>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> ---
>>  arch/arm/boot/dts/am335x-bone.dts | 123 +++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 123 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/am335x-bone.dts b/arch/arm/boot/dts/am335=
x-bone.dts
>> index 94ee427..be2c572 100644
>> --- a/arch/arm/boot/dts/am335x-bone.dts
>> +++ b/arch/arm/boot/dts/am335x-bone.dts
>
>better to make a nand_cape dts which includes the am335x-bone.dts?
>
Actually, I'm not in favor of having too many "xx_board_common.dts" files,
because it un-necessarily complexes things.

We already have "arch/arm/boot/dts/am335x-bone-common.dtsi" which just save=
s
some lines common to DTS of both Beaglebone-LT(white) and Beaglebone-Black.
And, there is no guarantee that Beaglebone-LT(white) will remain compatible=
 to
Beaglebone-black in future.=20
Example: some capes are not compatible to beaglebone-black [1], [2].

So, I prefer to keep separate GPMC NAND nodes separately in both DTS,
unless there is a strong convincing reason otherwise.


[1] http://elinux.org/CircuitCo:BeagleBoardToys
[2] http://elinux.org/BeagleBone_Black_Capes

with regards, pekon
