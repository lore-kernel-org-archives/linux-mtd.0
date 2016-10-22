Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxu2y-0001qO-Fc
 for linux-mtd@lists.infradead.org; Sat, 22 Oct 2016 11:01:05 +0000
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36680)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1bxu2Y-000596-6W
 for linux-mtd@lists.infradead.org; Sat, 22 Oct 2016 07:00:42 -0400
Received: by mail-lf0-f45.google.com with SMTP id b75so162577927lfg.3
 for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2016 04:00:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1475668319.git.cyrille.pitchen@atmel.com>
References: <cover.1475668319.git.cyrille.pitchen@atmel.com>
From: Jagan Teki <jagan@openedev.com>
Date: Sat, 22 Oct 2016 16:30:35 +0530
Message-ID: <CAD6G_RR4Av8+szo9v2oucCFvwnow86gMVC-Ku_-Qfy18TVMGgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, Marek Vasut <marex@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 5, 2016 at 5:30 PM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> Hi all,
>
> This series extends support of SPI protocols to new protocols such as
> SPI x-2-2 and SPI x-4-4. Also spi_nor_scan() tries now to select the right
> op codes, timing parameters (number of mode and dummy cycles) and erase
> sector size by parsing the Serial Flash Discoverable Parameter (SFDP)
> tables, when available, as defined in the JEDEC JESD216 specifications.
>
> When SFDP tables are not available, legacy settings are still used for
> backward compatibility (SPI and earlier QSPI memories).
>
> Support of SPI memories >128Mbits is also improved by using the 4byte
> address instruction set, when available. Using those dedicated op codes
> is stateless as opposed to enter the 4byte address mode, hence a better
> compatibility with some boot loaders which expect to use 3byte address
> op codes.

The memories which are > 128Mbits should have 4-bytes addressing
support based on my experience, do you think BAR is also required
atleast from spi-nor side?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
