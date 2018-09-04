Received: from mail-ve1eur01on0611.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::611]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx9R4-00078I-5L
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 11:23:55 +0000
From: Ashish Kumar <ashish.kumar@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Query| USE of MTD_CFI_ADV_OPTIONS for SPI-NOR/serial-NOR flash for
 BE-kernel on arm64
Date: Tue, 4 Sep 2018 11:23:40 +0000
Message-ID: <VI1PR04MB4015330F5C4051A566AE13A295030@VI1PR04MB4015.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi all,

I may sound very na=EFve, but I do not have other options to look for.
What I was trying to achieve was "running BE-kernel on arm64, with the SPI-=
NOR controller(fsl_qspi) configured for AHB and IP buffer in BE mode. It wo=
rks to an extent but not all is working correctly.

I was grep-ing through /driver/mtd/ and include/linux/mtd to look for these=
 advance option(MTD_CFI_ADV_OPTIONS) to be used for SPI-NOR interface, is t=
here a way this(MTD_CFI_BE_BYTE_SWAP) can be achieved for SPI-NOR flash?

Is anyone working on this, or similar thing?

config MTD_CFI_ADV_OPTIONS
        bool "Flash chip driver advanced configuration options"
        depends on MTD_GEN_PROBE
        help
          If you need to specify a specific endianness for access to flash
          chips, or if you wish to reduce the size of the kernel by includi=
ng
          support for only specific arrangements of flash chips, say 'Y'. T=
his
          option does not directly affect the code, but will enable other
          configuration options which allow you to do so.

          If unsure, say 'N'.

choice
        prompt "Flash cmd/query data swapping"
        depends on MTD_CFI_ADV_OPTIONS
        default MTD_CFI_NOSWAP
        ---help---
          This option defines the way in which the CPU attempts to arrange
          data bits when writing the 'magic' commands to the chips. Saying
          'NO', which is the default when CONFIG_MTD_CFI_ADV_OPTIONS isn't
          enabled, means that the CPU will not do any swapping; the chips
          are expected to be wired to the CPU in 'host-endian' form.
          Specific arrangements are possible with the BIG_ENDIAN_BYTE and
          LITTLE_ENDIAN_BYTE, if the bytes are reversed.

config MTD_CFI_NOSWAP
        bool "NO"

config MTD_CFI_BE_BYTE_SWAP
        bool "BIG_ENDIAN_BYTE"

config MTD_CFI_LE_BYTE_SWAP
        bool "LITTLE_ENDIAN_BYTE"

endchoice\

Regards
Ashish
