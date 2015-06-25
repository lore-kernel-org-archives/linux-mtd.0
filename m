Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7vtz-0003K0-OT
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 01:24:29 +0000
Received: by pactm7 with SMTP id tm7so39286334pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jun 2015 18:24:05 -0700 (PDT)
Date: Wed, 24 Jun 2015 18:24:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Subject: Re: [PATCH V2 0/2] mtd: nandsim: fix error handling
Message-ID: <20150625012401.GS4917@ld-irv-0074>
References: <1435193209-54305-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1435193209-54305-1-git-send-email-shengyong1@huawei.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, richard@nod.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 25, 2015 at 12:46:47AM +0000, Sheng Yong wrote:
> V2:
> Resend the patches against l2-mtd/master.

  CC      drivers/mtd/nand/nandsim.o
drivers/mtd/nand/nandsim.c: In function ‘init_nandsim’:
drivers/mtd/nand/nandsim.c:765:4: error: label ‘error’ used but not defined
    goto error;
    ^

The point wasn't to rebase blindly. I got this far already. But you should be
testing (at a minimum, compile testing) your changes!

Brian
