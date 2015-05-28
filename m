Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7Sk-0002K7-MZ
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:43:47 +0000
Received: by padbw4 with SMTP id bw4so34513455pad.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:43:25 -0700 (PDT)
Date: Thu, 28 May 2015 16:43:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?iso-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Subject: Re: [PATCH 1/3] include/common.h: fix build against musl
Message-ID: <20150528234322.GB2878@ld-irv-0074>
References: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 24, 2015 at 12:12:51AM +0200, Jörg Krause wrote:
> Like uClibc version older than (not yet released) 0.9.34 musl does not have
> a rpmatch() implementation.
> 
> uClibc defines both __UCLIBC__ and __GLIBC__. So first check for uCibc and its
> version and then for a non glibc implementation (like musl). Note, musl does
> not define __MUSL__.
> 
> Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>

Applied this one to mtd-utils.git. Thanks!
