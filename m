Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1da3E9-00019p-8e
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 17:02:35 +0000
Received: by mail-pf0-x242.google.com with SMTP id c23so13335541pfe.5
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2017 10:02:12 -0700 (PDT)
Date: Tue, 25 Jul 2017 10:02:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mario Rugiero <mrugiero@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Geliang Tang <geliangtang@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: remove unused variable in mtdswap
Message-ID: <20170725170208.GA77953@google.com>
References: <20170725154208.355381-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170725154208.355381-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 25, 2017 at 05:41:58PM +0200, Arnd Bergmann wrote:
> The only user of this variable was removed, leading to a
> new harmless warning:
> 
> drivers/mtd/mtdswap.c: In function 'mtdswap_add_debugfs':
> drivers/mtd/mtdswap.c:1317:17: error: unused variable 'dev' [-Werror=unused-variable]
> 
> This removes the variable as well.
> 
> Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I beat you to it:

https://patchwork.ozlabs.org/patch/793136/
[PATCH] mtd: mtdswap: remove unused variables 'dev' and 'gd'
