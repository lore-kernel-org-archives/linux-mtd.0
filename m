Received: from forward2m.mail.yandex.net ([2a02:6b8:0:2519::3:11])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZLlH-0001xC-AQ
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 14:19:43 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Yann Collet <yann.collet.73@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <loom.20131023T201657-894@post.gmane.org>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <loom.20131023T201657-894@post.gmane.org>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <237221382623942@web21m.yandex.ru>
Date: Thu, 24 Oct 2013 18:12:22 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



23.10.2013, 22:26, "Yann Collet" <yann.collet.73@gmail.com>:
> UBIFS error (pid 4288): ubifs_decompress: cannot decompress 12 bytes,
> (...)
> ššššššššdata size ššššš12
> ššššššššdata:
> šššššššš00000000: 1f 00 01 00 ff e8 50 00 00 00 00 00
>
> The compressed format is correct.
> It describes a flow of 00, of size ~500.
>
> So the problem seems more likely on the decompression side.
>
> Are you sure you are providing "12" as the "input size" parameter ? and that
> the "maximum output size" parameter is correctly provided ? (i.e. >= to
> original data size)
>

Decompression code in kernel[1] is heavily modified. In particular, lz4_uncompress
function (used in this case) does not have input size parameter at all,
while it's present in lz4_uncompress_unknownoutputsize.

[1] lib/lz4/lz4_decompress.c

-- 
Regards,
Konstantin
