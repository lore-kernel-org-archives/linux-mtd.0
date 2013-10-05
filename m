Received: from forward15.mail.yandex.net ([2a02:6b8:0:801::5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSWVm-0004i3-Ch
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 18:23:32 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>,
 Brent Taylor <motobud@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <CAGWqfihkGT5wWDoFGTtBHK31+Fvav8if6iy_jFJ7io1H_wktFA@mail.gmail.com>
References: <CAGWqfihkGT5wWDoFGTtBHK31+Fvav8if6iy_jFJ7io1H_wktFA@mail.gmail.com>
Subject: Re: [PATCH v0.5] mtd-utils: mkfs.ubifs: Add support for LZ4HC
 compression
MIME-Version: 1.0
Message-Id: <165301380997382@web12j.yandex.ru>
Date: Sat, 05 Oct 2013 22:23:02 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



05.10.2013, 18:48, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
> All,
>
> After some time to do some testing this is a second version of the
> same patch. Now lz4hc gets actually used. šHowever at this moment in
> time only improvement in terms of cpu time is seen, but lz4hc in this
> context seems to behave worse than LZO, on my local system:
>
> -rw-r--r-- 1 edb šedb š28M Oct š5 16:22 imag.lz4hc
> -rw-r--r-- 1 root root 25M Oct š5 16:22 imag.lzo
> -rw-r--r-- 1 root root 43M Oct š5 16:11 imag.none
> -rw-r--r-- 1 root root 22M Oct š5 16:30 imag.zlib
>
> The only thing which comes immediately to mind is that due to the size
> of the chunks (in my case large block being compressed is 4k) lz4hc
> isn't starting to pay off ..

Looks like it might be useful to have mixed lz4hc/lzo mode - lz4hc is faster,
lzo provides better ratio, and both don't use additional memory for decompression.
I did no speed benchmarks yet though.

It also might be that lz4 has tuning parameters which may be useful for rootfs
compression in case when most of files are not modified most of the times, i.e.
trade compression time to space efficiency while keeping decompression speed.

-- 
Regards,
Konstantin
