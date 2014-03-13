Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNyzt-0005Hp-5J
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 06:20:06 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Menon, Nishanth" <nm@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: RE: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for
 beaglebone NAND cape
Date: Thu, 13 Mar 2014 06:19:34 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB2F96@DBDE04.ent.ti.com>
References: <1394621360-2457-1-git-send-email-pekon@ti.com>
 <1394621360-2457-2-git-send-email-pekon@ti.com> <532070C8.1030903@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2CF1@DBDE04.ent.ti.com>
 <CAGo_u6rvUqa-7afTFzBahDJuyVkXAj5J2LL8tQRjZuf8_xWXWA@mail.gmail.com>
 <CAOCHtYhqZoCF13e1YjBiWPufDEmVotL3chO9ZUtivWbVTWVfiQ@mail.gmail.com>
 <20140312192850.GF1996@atomide.com> <5320C8B5.601@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2E95@DBDE04.ent.ti.com>
 <20140312215337.GA5735@kahuna>
In-Reply-To: <20140312215337.GA5735@kahuna>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[...]
> arch/arm/boot/dts/Makefile                    |    1 +
> arch/arm/boot/dts/am335x-bone-memory-cape.dts |  123 ++++++++++++++++++++=
+++++
> 2 files changed, 124 insertions(+)
> create mode 100644 arch/arm/boot/dts/am335x-bone-memory-cape.dts
>
>diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>index 0320303..c5e9bfa 100644
>--- a/arch/arm/boot/dts/Makefile
>+++ b/arch/arm/boot/dts/Makefile
>@@ -226,6 +226,7 @@ dtb-$(CONFIG_ARCH_OMAP2PLUS) +=3D omap2420-h4.dtb \
> 	am335x-evmsk.dtb \
> 	am335x-bone.dtb \
> 	am335x-boneblack.dtb \
>+	am335x-bone-memory-cape.dtb\
> 	am335x-nano.dtb \
> 	am335x-base0033.dtb \
> 	am3517-evm.dtb \
>diff --git a/arch/arm/boot/dts/am335x-bone-memory-cape.dts b/arch/arm/boot=
/dts/am335x-bone-memory-cape.dts
>new file mode 100644
>index 0000000..7ab088d
>--- /dev/null
>+++ b/arch/arm/boot/dts/am335x-bone-memory-cape.dts
>
>From discussions, option I could think are..

(a) NAND cape node added in both 'am335x-bone.dts' and
   'am335x-boneblack.dts' but "disabled" by default.

(b) NAND cape node in new '.dts' file (as mentioned above), and generate
   a separate blob individual for cape.

(c) NAND cape node in existing 'am335x-bone-common.dtsi', "disabled"
   by default. But there is no guarantee that future boards remain
   compatible and same 'common_xx.dtsi' can be reused later.

I'll wait for Tony/Benoit-C. to decide on what suits them, as they are the
ones who have to maintain all these. Tony ?

with regards, pekon
