Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpXxv-0004do-EB
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 07:07:59 +0000
Received: by mail-pa0-f45.google.com with SMTP id ey11so10505433pad.4
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 00:07:35 -0700 (PDT)
Received: from norris-Latitude-E6410 (5520-maca-inet1-outside.broadcom.com.
 [216.31.211.11])
 by mx.google.com with ESMTPSA id nw13sm84449664pab.37.2014.05.28.00.07.33
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Wed, 28 May 2014 00:07:34 -0700 (PDT)
Date: Wed, 28 May 2014 00:07:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/6] mtd: small cleanups
Message-ID: <20140528070726.GF5241@norris-Latitude-E6410>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 20, 2014 at 11:16:57PM -0700, Brian Norris wrote:
> This series consists of miscellaneous fixes and cleanups, mostly caught through
> some sort of static analysis (gcc warnings, sparse, Coverity, etc.).
> 
> Brian Norris (6):
>   mtd: pfow: remove unused variable
>   mtd: slram: fix unused variable warning
>   mtd: maps: sc520cdp: fix warnings
>   mtd: nand_bbt: remove unused variable
>   mtd: nand_bbt: handle error case for nand_create_badblock_pattern()
>   mtd: nand: r852: correct write_buf loop bounds

Pushed all 6 to l2-mtd.git.

Brian
