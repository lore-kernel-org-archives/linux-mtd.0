Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDoU9-000717-F9
 for linux-mtd@lists.infradead.org; Sat, 31 Mar 2012 02:56:14 +0000
Received: by bkcjk13 with SMTP id jk13so1409180bkc.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2012 19:56:10 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <201203281113.19827.hartleys@visionengravers.com>
References: <201203281113.19827.hartleys@visionengravers.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 30 Mar 2012 22:55:47 -0400
Message-ID: <CAMjpGUfCyXQDeXTS+LKdhbU52YH73-biDHRscsp5Edx4sMTvxA@mail.gmail.com>
Subject: Re: [PATCH 3/5] blackfin: Use the plat_nand default partition parser
To: H Hartley Sweeten <hartleys@visionengravers.com>
Content-Type: text/plain; charset=UTF-8
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 28, 2012 at 14:13, H Hartley Sweeten wrote:
> Use the default partition parser, cmdlinepart, provided by the plat_nand driver.

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
