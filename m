Received: from mail-wm0-f43.google.com ([74.125.82.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5pXG-0001IZ-4o
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 09:26:02 +0000
Received: by mail-wm0-f43.google.com with SMTP id r191so24551413wmg.4
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 02:25:43 -0700 (PDT)
Subject: Re: [PATCH v10 2/2] mtd: fsl-quadspi: fix init AHB read in
 fsl_qspi_nor_setup()
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 frieder.schrempf@exceet.de, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
References: <1523349348-20778-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1523349348-20778-3-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9aaa221a-0d0c-d001-9cc9-477d3506c429@gmail.com>
Date: Tue, 10 Apr 2018 11:25:09 +0200
MIME-Version: 1.0
In-Reply-To: <1523349348-20778-3-git-send-email-yogeshnarayan.gaur@nxp.com>
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

On 04/10/2018 10:35 AM, Yogesh Gaur wrote:
> Move AHB read initialize in fsl_qspi_nor_setup().
> 
> In file spi-nor.c, func spi_nor_scan() calls nor->read() thru
> spi_nor_read_sfdp() API.
> 
> Presently, fsl_qspi_init_ahb_read() called from fsl_qspi_nor_setup_last().
> Func fsl_qspi_probe() calls spi_nor_scan() first and then calls
> fsl_qspi_nor_setup_last().
> 
> When nor->read() being called from inside spi_nor_read_sfdp(), QSPI cntlr
> AHB mode initialization is not yet done results in data read error.
> 
> Initialize AHB read inside fsl_qspi_nor_setup().

Please run the commit message through aspell or somesuch, hint : func,
thru, cntlr .

-- 
Best regards,
Marek Vasut
