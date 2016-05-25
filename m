Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5gKk-0006Ms-6n
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 21:27:19 +0000
Received: by mail-pa0-x236.google.com with SMTP id eu11so12300845pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 25 May 2016 14:26:57 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: dwmw2@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 devicetree@vger.kernel.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com,
 Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFC/PATCH 0/2] Adding support to expose mtd flash otp regions via
 nvmem
Date: Wed, 25 May 2016 14:26:45 -0700
Message-Id: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

attached series allows exporting mtd flash otp regions via nvmem.
This is my first stab and still needs cleanup, but I wanted to get some
general feedback on whether this can conceptually work.

In an earlier conversation with Boris (in Cc) he suggested (I think),
something similar to what I tried to implement.

If someone has suggestions (especially on how to deduplicate some of the parsing
code w.r.t to partitions I'd be happy to rework the series)

Thanks for your feedback,

Moritz

Moritz Fischer (2):
  doc: bindings: Add bindings documentation for mtd otp nvmem
  mtd: otp: Expose mtd flash otp regions as nvmem providers

 .../devicetree/bindings/mtd/otp-nvmem.txt          |  62 ++++++++++
 drivers/mtd/Kconfig                                |   8 ++
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/mtdcore.c                              |  35 ++++++
 drivers/mtd/mtdcore.h                              |   1 +
 drivers/mtd/mtdnvmem.c                             | 127 +++++++++++++++++++++
 drivers/mtd/mtdnvmem.h                             |  25 ++++
 drivers/mtd/mtdpart.c                              | 112 ++++++++++++++++++
 drivers/mtd/ofpart.c                               | 102 +++++++++++++++++
 9 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/otp-nvmem.txt
 create mode 100644 drivers/mtd/mtdnvmem.c
 create mode 100644 drivers/mtd/mtdnvmem.h

-- 
2.5.5
