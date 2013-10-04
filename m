Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VS04U-0003e1-RW
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 07:45:11 +0000
Message-ID: <1380872684.18862.19.camel@sauron.fi.intel.com>
Subject: Re: lz4hc compression in UBIFS?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Fri, 04 Oct 2013 10:44:44 +0300
In-Reply-To: <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Konstantin Tokarev <annulen@yandex.ru>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-10-03 at 22:09 -0500, Brent Taylor wrote:
> +config UBIFS_FS_LZ4HC
> +       bool "LZ4HC compression support" if UBIFS_FS_ADVANCED_COMPR
> +       depends on UBIFS_FS && CRYPTO_LZ4HC
> +       default y
> +       help
> +          LZ4HC compressor is generally faster than zlib but compresses worse.
> +          Say 'Y' if unsure.

I'd say something like:

LZ4HC is generally beats LZO on decompression speed while provides a lot
better compression ratio (comparable to zlib). Compression speed is
generally slower comparing to LZO, but faster comparing to zlib.

Makes sense?

-- 
Best Regards,
Artem Bityutskiy
