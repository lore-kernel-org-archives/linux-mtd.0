Received: from mail-ig0-f175.google.com ([209.85.213.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnmcD-0005uB-Q5
 for linux-mtd@lists.infradead.org; Fri, 23 May 2014 10:22:18 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so484764igb.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 May 2014 03:21:56 -0700 (PDT)
Date: Fri, 23 May 2014 11:21:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 02/47] mtd: nand: stm_nand_bch: provide Device Tree
 documentation
Message-ID: <20140523102151.GT19747@lee--X1>
References: <20980858CB6D3A4BAE95CA194937D5E73EAD826F@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAD826F@DBDE04.ent.ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@stlinux.com" <kernel@stlinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >This is where we describe the different new and generic options used by
> >the ST BCH driver.
> >
> >Cc: devicetree@vger.kernel.org
> >Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >---
> > Documentation/devicetree/bindings/mtd/stm-nand.txt | 123 +++++++++++++++++++++
> > 1 file changed, 123 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/mtd/stm-nand.txt
> >
> >diff --git a/Documentation/devicetree/bindings/mtd/stm-nand.txt
> >b/Documentation/devicetree/bindings/mtd/stm-nand.txt
> >new file mode 100644
> >index 0000000..9f9325f
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/mtd/stm-nand.txt
> >@@ -0,0 +1,123 @@
> >+STM BCH NAND Support
> >+--------------------
> >+
> >+Required properties:
> >+
> >+- compatible		: Should be "st,nand-bch"
> >+- reg			: Should contain register's location and length
> >+- reg-names		: "nand_mem" - NAND Controller register map
> >+			  "nand_dma" - BCH Controller DMA configuration map
> >+- interrupts		: Interrupt number
> >+- interrupt-names	: "nand_irq" - NAND Controller IRQ
> >+- st,nand-banks		: Subnode representing one or more "banks" of NAND
> >+                          Flash, connected to an STM NAND Controller (see
> >+                          description below).
> >+- nand-ecc-strength	: Generic NAND property (See mtd/nand.txt)
> >+- st,bch-bitflip-threshold
> >+			: The threshold at which the number of corrected bit-
> >+			  flips per sector is deemed to have reached an
> >+			  excessive level (triggers '-EUCLEAN' to be returned
> >+			  to the caller).  The value should be in the range 1
> >+			  to <ecc-strength> where <ecc-strength> is 18 or 30,
> >+			  depending on the BCH ECC mode in operation.  A value
> >+			  of 0, or if left unspecified, is interpreted by the
> >+			  driver as <ecc-strength>.
> >+
> Please drop this one as discussed in other thread that bitflip_threshold
> does not qualify as DT binding (as it's not a hardware or const parameter).

Fixed.

> >+Properties describing Bank of NAND Flash ("st,nand-banks"):
> >+
> >+- st,nand-csn		: Chip select associated with the Bank.
> >+- st,nand-timing-spec	: [Optional] NAND Device Timing Data.  All times
> >+                          expressed in ns, except where stated otherwise:
> 
> I think DT maintainers don't prefer NAND timings being passed by DT,
> Instead they want it parsed from ONFI.
> Refer comments by 'Rob Herring <robherring2@gmail.com>' on
> [PATCH RFC 1/3] Devicetree: Add pl353 smc controller devicetree binding information

Fixed.

> >+Note, during initialisation, the NAND Controller timing registers are configured
> >+according to one of the following methods, in order of precedence:
> >+
> >+           1. Configuration based on "st,nand_timing_spec" if supplied.
> >+
> Not sure if this mode is really required, as almost all devices are ONFI compliant.
> Please check with 'Rob Herring <robherring2@gmail.com>'

Fixed.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
