Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bO6fR-0004gl-9Y
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 17:12:49 +0000
Received: by mail-lf0-x233.google.com with SMTP id l69so35839941lfg.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 10:12:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468602228-25154-1-git-send-email-moritz.fischer@ettus.com>
References: <1468602228-25154-1-git-send-email-moritz.fischer@ettus.com>
From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 15 Jul 2016 22:42:25 +0530
Message-ID: <CAD6G_RT84jtTYcOkW87Z-g0j9sAVuku3RCpWXHZC_DLSEFrT1w@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q016A
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Brian Norris <computersforpeace@gmail.com>, ezequiel@vanguardiasur.com.ar,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 moritz.fischer.private@gmail.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 July 2016 at 22:33, Moritz Fischer <moritz.fischer@ettus.com> wrote:
> This commit adds support in the spi-nor driver for the
> N25Q016A, a 16Mbit SPI NOR flash from Micron.
>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Jagan Teki <jteki@openedev.com>
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>

Reviewed-by: Jagan Teki <jteki@openedev.com>

-- 
Jagan.
