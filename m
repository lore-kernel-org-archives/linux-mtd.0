Received: from forward3h.mail.yandex.net ([2a02:6b8:0:f05::3])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYt3r-0006Lv-LJ
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 07:41:01 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Brent Taylor <motobud@gmail.com>
In-Reply-To: <CAP+RiCDVTMb6RE5kGCYSyMCF9JMpSUAM5jS4YPObkbBu=zD59g@mail.gmail.com>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <183031382371160@web6m.yandex.ru>
 <CAP+RiCDKgRqi8_Y4OMqyJyCUpKJW5BVE=hNwp3WzQ7PuOMWGMw@mail.gmail.com>
 <139841382436609@web24g.yandex.ru>
 <CAP+RiCDVTMb6RE5kGCYSyMCF9JMpSUAM5jS4YPObkbBu=zD59g@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <300471382514034@web11h.yandex.ru>
Date: Wed, 23 Oct 2013 11:40:34 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



23.10.2013, 09:26, "Brent Taylor" <motobud@gmail.com>:
> Konstantin,
> šššI did my testing with data from /dev/urandom (which I now realize
> wasn't the best choice of data source), but if I use /dev/zero (which
> actually causes data compression to occur), the decompressor fails. šI
> don't know the internal workings of the lz4hc compressor or the lz4
> decompressor. šI couldn't find any examples of any code in the kernel
> actually using the compressor. šI've cc'ed the maintainers of the
> lz4hc_compress.c to see if they my have some more insight to the
> issue.

Does decompressor fail for you with the same error messages?

Have you tried to copy my file to the volume? It looks like minimal test case
for my board, if I remove any line decompressor works fine.

-- 
Regards,
Konstantin
