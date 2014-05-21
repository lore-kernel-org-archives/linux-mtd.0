Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmulV-0006TA-Uy
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 00:52:18 +0000
Received: by mail-pb0-f42.google.com with SMTP id md12so840535pbc.29
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 17:51:56 -0700 (PDT)
Date: Tue, 20 May 2014 17:51:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ron <ron@debian.org>
Subject: Re: [PATCH] NAND_ECC_SOFT_BCH can support subpage reads too
Message-ID: <20140521005153.GB22233@ld-irv-0074>
References: <1398403895-5176-1-git-send-email-ron@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398403895-5176-1-git-send-email-ron@debian.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 25, 2014 at 03:01:35PM +0930, Ron wrote:
> Signed-off-by: Ron Lee <ron@debian.org>

Pushed to l2-mtd.git. Thanks!

BTW, can you fix your git config so that it uses your full name? You
have the sign-off right, but git-send-email is still just picking your
name up as "Ron."

Brian
