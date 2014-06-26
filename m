Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X02TZ-0003qq-8H
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 05:44:01 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for
 beaglebone NAND cape
Date: Thu, 26 Jun 2014 05:43:30 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF79CC@DBDE04.ent.ti.com>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-2-git-send-email-pekon@ti.com>
 <20140625152735.GA17792@arch.cereza>
In-Reply-To: <20140625152735.GA17792@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, Jason Kridner <jkridner@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 =?iso-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Ezequiel Garcia [mailto:ezequiel@vanguardiasur.com.ar]
>>On 24 Jun 05:54 PM, Pekon Gupta wrote:
>> +&gpmc {
>> +	ranges =3D <0 0 0 0x01000000>;	/* address range =3D 16MB (minimum GPMC=
 partition) */
>> +	nand@0,0 {
>> +		status =3D "disabled";
>> +		reg =3D <0 0 4>;		/* device IO registers */
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&bbcape_nand_flash_pins>;
>> +		ti,nand-ecc-opt =3D "bch8";
>> +		ti,elm-id =3D <&elm>;
>
>Don't you need something like this to turn on the elm device?
>
>&elm {
>	status =3D "okay";
>};
>
No, This was the intend of these patches to keep cape DTS as "disabled"
so that:
(1)These patches should not change the behavior of existing DTS
 (am335x-boneblack.dts or am335x-bone.dts), or conflict with
 any existing node or other cape DTS.
(2) In-case of share-pin mux where multiple capes use same pins
Cape DTS should not conflict each other.

Now, to enable the choice of cape without hacking any source file,
user can use u-boot commands (refer to example in cover-letter):
/* load DTB */
u-boot> tftp 0x81000000 am335x-boneblack.dtb
u-boot> fdt addr 0x81000000
/* disabled conflicting MMC2 (eMMC) */
u-boot> fdt set  /ocp/mmc@481d8000 status \d\i\s\a\b\l\e\d
/* enable NAND cape*/
u-boot> fdt set  /ocp/elm status \o\k\a\y
u-boot> fdt set  /ocp/gpmc status \o\k\a\y
u-boot> fdt set  /ocp/gpmc/nand status \o\k\a\y

And then boot using this DTB loaded at 0x81000000
(you can put all these commands in uEnv as part of $bootcmd)


with regards, Pekon
