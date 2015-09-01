Received: from mail-oi0-f43.google.com ([209.85.218.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWgCJ-0002Uc-8E
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 07:41:39 +0000
Received: by oigk185 with SMTP id k185so73102985oig.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 00:41:18 -0700 (PDT)
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com.
 [209.85.214.182])
 by smtp.gmail.com with ESMTPSA id ut2sm12097187obc.1.2015.09.01.00.41.15
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2015 00:41:15 -0700 (PDT)
Received: by obbfr1 with SMTP id fr1so113986115obb.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 00:41:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440053705-3836-1-git-send-email-vndao@altera.com>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
Date: Tue, 1 Sep 2015 15:41:15 +0800
Message-ID: <CAN1oZWz3O=ebu5o2k5CW0=i87dfMaBKfEEC7fgQ6=Ak3k+3qDQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
From: Viet Nga Dao <vndao@altera.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 nga_chi86 <ngachi86@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2015 at 2:55 PM,  <vndao@altera.com> wrote:
> From: VIET NGA DAO <vndao@altera.com>
>
> Altera Quad SPI Controller is a soft IP which enables access to
> Altera EPCS and EPCQ flash chips. This patch adds driver
> for these devices.
>
> Signed-off-by: VIET NGA DAO <vndao@altera.com>
>
> ---
> v5:
> - Remove Micron support
> - Add multiple flashes probe failure handle
>
> v4:
> - Add more flash devices support ( EPCQL and Micron)
> - Remove redundant messages
> - Change EPCQ_OPCODE_ID to NON_EPCS_OPCODE_ID
> - Replace get_flash_name to altera_quadspi_scan
> - Remove clk related parts
> - Remove altera_quadspi_plat
> - Change device tree reg name and remove opcode-id
>
> v3:
> - Change altera_epcq driver name to altera_quadspi for more generic name
> - Implement flash name searching in altera_quadspi.c instead of spi-nor
> - Edit the altra quadspi info table in spi-nor
> - Remove wait_til_ready in all read,write, erase, lock, unlock functions
> - Merge .h and .c into 1 file
>
> v2:
> - Change to spi_nor structure
> - Add lock and unlock functions for spi_nor
> - Simplify the altera_epcq_lock function
> - Replace reg by compatible in device tree
> ---

Hi, i decided to wait for the hardware fixed and tested before
submitting new patch.
Thanks for all for your reviews and comments.
Viet Nga
