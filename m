Received: from forward15.mail.yandex.net ([2a02:6b8:0:801::5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VT6Gg-00042F-KE
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 08:34:20 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
In-Reply-To: <CAGWqfihRaNSs-uc9utTPaNPHU__KTS5saxgc2xUrkw5sYy4kkQ@mail.gmail.com>
References: <CAGWqfihkGT5wWDoFGTtBHK31+Fvav8if6iy_jFJ7io1H_wktFA@mail.gmail.com>
 <165301380997382@web12j.yandex.ru> <47881381073118@web4j.yandex.ru>
 <CAGWqfihRaNSs-uc9utTPaNPHU__KTS5saxgc2xUrkw5sYy4kkQ@mail.gmail.com>
Subject: Re: [PATCH v0.5] mtd-utils: mkfs.ubifs: Add support for LZ4HC
 compression
MIME-Version: 1.0
Message-Id: <227411381134834@web27j.yandex.ru>
Date: Mon, 07 Oct 2013 12:33:54 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brent Taylor <motobud@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



07.10.2013, 10:34, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
> Konstantin,
>
> Sounds interesting, I'll integrate this into a next version of the
> patch. Perhaps it make sense just to replace favor_lzo and favor_lz4hc
> into something generic like favor_COMPR1_COMPR2 where COMPR2 gets
> chosen if it is more than favor-percent better than COMPR1. Even
> though today you're probably use lzo/zlib to optimise for size at a
> reasonable cost of some speed šwhile you're probably use lzo/lz4hc if
> you want to optimise for speed at a reasonable cost of size, but that
> probably makes it more extensible in the future. Does this sound
> reasonable ?

Yeah, that would be useful.

-- 
Regards,
Konstantin
