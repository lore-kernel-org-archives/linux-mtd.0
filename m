Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab7q4-0001Kx-JP
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 14:33:21 +0000
Message-ID: <1456929164.2169.21.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: mtdram: Add parameter for setting writebuf
 size
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Alexander Stein <alexander.stein@systec-electronic.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Date: Wed, 02 Mar 2016 16:32:44 +0200
In-Reply-To: <1456924001-1000-1-git-send-email-alexander.stein@systec-electronic.com>
References: <1456924001-1000-1-git-send-email-alexander.stein@systec-electronic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-03-02 at 14:06 +0100, Alexander Stein wrote:
> +config MTDRAM_WRITEBUF_SIZE
> +       int "MTDRAM write buf size in Bytes"
> +       depends on MTD_MTDRAM
> +       default "64"
> +       help
> +         This allows you to configure the write buffer size in the
> device
> +         emulated by the MTDRAM driver.  If the MTDRAM driver is
> built
> +         as a module, it is also possible to specify this as a
> parameter when
> +         loading the module. E.g. ubifs relies this in the recovery
> algorithm.

Why another Kconfig option (compile-time) instead of just a module
parameter (run-time), which would be more flexible?
