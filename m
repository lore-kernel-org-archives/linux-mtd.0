Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OylWj-0005pp-Kg
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:07:54 +0000
Received: by bwz19 with SMTP id 19so1621872bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:07:52 -0700 (PDT)
Subject: Re: [PATCH] mkfs.ubifs: Fix heap corruption on LEB overrun
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <1fcf6a9591841eba82df96a80da0bdfa@localhost>
References: <1fcf6a9591841eba82df96a80da0bdfa@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:06:09 +0300
Message-ID: <1285247169.29268.124.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-22 at 16:01 -0700, Kevin Cernekee wrote:
> If max_leb_cnt (-c option) is set too low, set_lprops() will corrupt
> the heap and may result in a scary looking crash:
> 
> $ bin/mkfs.ubifs -U -r romfs -o ubifs.img -m 512 -e 15360 -c 39
> Error: max_leb_cnt too low (241 needed)
> *** glibc detected *** bin/mkfs.ubifs: double free or corruption (!prev): 0x088fe070 ***
> ======= Backtrace: =========
> /lib32/libc.so.6(+0x6c231)[0xf75fb231]
> /lib32/libc.so.6(+0x6dab8)[0xf75fcab8]
> /lib32/libc.so.6(cfree+0x6d)[0xf75ffb9d]
> bin/mkfs.ubifs[0x804e801]
> bin/mkfs.ubifs[0x804e94b]
> bin/mkfs.ubifs[0x804e99d]
> /lib32/libc.so.6(__libc_start_main+0xe6)[0xf75a5bd6]
> bin/mkfs.ubifs(__fxstat64+0x55)[0x80491e1]
> ======= Memory map: ========

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
