From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Mar 2003 06:56:24 +0000
Subject: help : JFFS2 compile error :background.c
In-Reply-To: <OE37v3DrhVRAGMd4uzH0000814c@hotmail.com>
References: <OE37v3DrhVRAGMd4uzH0000814c@hotmail.com>
Message-ID: <1047020183.18755.38.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-03-07 at 01:50, guo_zhenglin wrote:
> I had use  mtd_cvs_20020612.tgz (from
>   http://qslinux.org/qslinux_2_4/tarballs/mtd_cvs_20020612.tgz)

Look at the macro recalc_sigpending(). It should be fairly obvious.

If you can reproduce it with the current code in 2.4.21-pre then I'll
care. With 2.4.4 and JFFS2 from that date your compilation error is
probably the least of your worries.

-- 
dwmw2
