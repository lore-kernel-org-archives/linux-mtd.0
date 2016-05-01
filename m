Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Cc: robh@kernel.org, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com, dwmw2@infradead.org
From: John Crispin <blogic@openwrt.org>
Message-ID: <f887fa30-2205-c102-bade-0071b3ee6b1f@openwrt.org>
Date: Sun, 1 May 2016 09:32:07 +0200
MIME-Version: 1.0
In-Reply-To: <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

i tried V4 just now. result is as before

if i set the ecc-strength above 16 it will give irq errors during boot
as shown below. values of 16 and below will probe without error but
hexdump on the device node will then throw ecc timeouts.

[    1.964296] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
[    1.970603] nand: Unknown W29N02GV
[    1.974038] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048,
OOB size: 64
[    1.981554] mtk-nand 1100d000.nfi: eccsize 1024 eccstrength 24
[    2.481827] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    2.988919] mtk-ecc 1100e000.ecc: decoder NOT idle
[    3.491818] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    3.998907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    4.501819] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    4.733511] mt7623-gsw switch@1b100000: port 3 link up
[    5.008907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    5.511817] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    6.018907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    6.023671] Bad block table not found for chip 0
[    6.521817] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    7.028907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    7.531816] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    8.038907] mtk-ecc 1100e000.ecc: decoder NOT idle
[    8.541817] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[    9.048901] mtk-ecc 1100e000.ecc: decoder NOT idle
[    9.551816] mtk-ecc 1100e000.ecc: decoder timeout - interrupt did not
arrive)
[   10.058906] mtk-ecc 1100e000.ecc: decoder NOT idle
[   10.063671] Bad block table not found for chip 0
[   10.068247] Scanning device for bad blocks
[   10.072769] Bad eraseblock 1 at 0x000000020000
[   10.077384] Bad eraseblock 2 at 0x000000040000
[   10.082017] Bad eraseblock 3 at 0x000000060000
[   10.086631] Bad eraseblock 4 at 0x000000080000

when i see errors during probe, the core will have received 2 ecc irqs

 25:       2058          0          0          0  MT_SYSIRQ  56 Level
 mtk-nand
 26:          2          0          0          0  MT_SYSIRQ  55 Level
 mtk-ecc

to me it is ambigous what FDM actually is. it seems that if FDM is known
the ecc-strength can be calculated and the amount of dts properties can
be reduced even further.

what i dont understand just yet is, do these erros i am seeing mean the
ecc core is not brought up properly or do they come from the dts
properties being bad.

	John
