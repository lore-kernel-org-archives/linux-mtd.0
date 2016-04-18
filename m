Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asC8K-0003o1-57
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 16:34:44 +0000
Received: by mail-pa0-x235.google.com with SMTP id zm5so80566645pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2016 09:34:23 -0700 (PDT)
Date: Mon, 18 Apr 2016 09:34:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH mtd-utils] fix build warnings w/newer glibc & _BSD_SOURCE
Message-ID: <20160418163420.GA52272@google.com>
References: <1460859111-9977-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460859111-9977-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 16, 2016 at 10:11:51PM -0400, Mike Frysinger wrote:
> The _BSD_SOURCE define has been deprecated for a while now.  Instead,
> code should be defining _DEFAULT_SOURCE.  By defining both, it'll work
> with both new & old versions warning-free.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils.git
