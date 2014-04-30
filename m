Received: from mail-wg0-f43.google.com ([74.125.82.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfQmP-0007Hu-3f
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 09:26:17 +0000
Received: by mail-wg0-f43.google.com with SMTP id l18so1413455wgh.14
 for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2014 02:25:53 -0700 (PDT)
Date: Wed, 30 Apr 2014 10:19:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC 43/47] mtd: nand: stm_nand_bch: read and write functions
 (BCH)
Message-ID: <20140430091935.GI29462@lee--X1>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-44-git-send-email-lee.jones@linaro.org>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5CC7@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB5CC7@DBDE04.ent.ti.com>
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "kernel@stlinux.com" <kernel@stlinux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Ezequiel Garcia \(ezequiel.garcia@free-electrons.com\)"
 <ezequiel.garcia@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >From: Lee Jones [mailto:lee.jones@linaro.org]
> >
> >Helper function for bch_mtd_read() and bch_mtd_write() to handle
> >multi-page or non-aligned reads and writes respectively.
> >
> >Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >---
> 
> I think below code is duplicate of nand_do_read_ops() and nand_do_write_ops()
> in nand_base.c. If you could just populate chip->ecc.read_page and
> chip->ecc.write_page much of this could be avoided.

chip->ecc.read_page and chip->ecc.write_page now populated.

> Also, you need to break your bch_read_page() into given generic NAND
> driver interfaces chip->ecc.calculate(), chip->ecc.correct() ...

Our h/w calculates and corrects automatically.  No need for
intervention.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
