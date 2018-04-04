Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3fnj-0003vn-4F
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 10:38:00 +0000
Received: by mail-wr0-x241.google.com with SMTP id y55so21813115wry.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2018 03:37:48 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] mtd: spi-nor: Add NXP FlexSPI driver
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 frieder.schrempf@exceet.de, suresh.gupta@nxp.com
References: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8a8cf9f4-61ae-ebd3-cb0f-117206f5fac3@gmail.com>
Date: Wed, 4 Apr 2018 12:28:30 +0200
MIME-Version: 1.0
In-Reply-To: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/04/2018 12:06 PM, Yogesh Gaur wrote:
> Add NXP FlexSPI driver
> 
> NXP uses FlexSPI controller.
> The FlexSPI(Flex Serial Peripheral controller) acts as an interface
> to external serial flash devices, maximum 4, each with upto 8 bidirectional
> data lines.
> 
> (1) The FlexSPI controller is driven by the LUT(Look-up Table) registers.
>  The LUT registers are a look-up-table for sequences of instructions.
>  A valid sequence consists of four LUT registers.
> 
> (2) The definition of the LUT register shows below:
>  ---------------------------------------------------
>  | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
>  ---------------------------------------------------

Is this IP somehow related todrivers/mtd/spi-nor/fsl-quadspi.c ?

-- 
Best regards,
Marek Vasut
