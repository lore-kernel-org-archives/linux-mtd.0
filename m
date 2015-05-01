Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yo9a3-0001d8-S2
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 11:58:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 7593E28BFF5
 for <linux-mtd@lists.infradead.org>; Fri,  1 May 2015 13:56:38 +0200 (CEST)
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
 [209.85.192.51])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 05AEB28BFF6
 for <linux-mtd@lists.infradead.org>; Fri,  1 May 2015 13:56:32 +0200 (CEST)
Received: by qgdy78 with SMTP id y78so37020662qgd.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2015 04:57:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150430173659.GA30177@bshelton-desktop>
References: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
 <20150429214648.GF32500@ld-irv-0074> <20150430173659.GA30177@bshelton-desktop>
From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 1 May 2015 13:57:13 +0200
Message-ID: <CAOiHx==fAPcji2=zjmO+m6yBX1xgB83XQk4+WgYgop=L4uZq7Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
To: Ben Shelton <ben.shelton@ni.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 30, 2015 at 7:36 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> The reason for doing this as a Kconfig option rather than with an additional
> partition is that we use the same .itb boot image (and kernel arguments) for
> a series of embedded controllers that have different NAND flash sizes, and we
> use the '-' command line parameter to give the root partition all the available
> space after the other partitions.

Wouldn't it make more sense to make cmdlineparts to recognize if it is
run on a nand flash that has on-flash BBT enabled, and then reduce the
SIZE_REMAINING partition's size by the amount of nand_bbt_descr's
maxblocks * erase block size?

Currently your proposed solution would break if boards have differing
erase block sizes, or if some have NOR flash, which makes it an option
for a rather narrow use case IMHO.


Regards
Jonas
