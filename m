Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM3xf-0002k8-SZ
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 01:55:12 +0000
Received: by mail-pf0-x241.google.com with SMTP id c74so11118894pfb.0
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 18:54:51 -0700 (PDT)
Date: Sat, 9 Jul 2016 18:54:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Denys Vlasenko <dvlasenk@redhat.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd/chips/cfi_cmdset_0020.c: Deinline
 do_write_buffer, save 5316 bytes
Message-ID: <20160710015448.GC7547@localhost>
References: <1460140543-12487-1-git-send-email-dvlasenk@redhat.com>
 <1460140543-12487-3-git-send-email-dvlasenk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460140543-12487-3-git-send-email-dvlasenk@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 08, 2016 at 08:35:43PM +0200, Denys Vlasenko wrote:
> This function compiles to 2554 bytes of machine code.
> In C, the function is almost 200 lines long.
> 
> It has only one callsite, but forced inlining that much code
> makes gcc generate significantly worse code. Let gcc itself decide
> what to do.
> 
> Signed-off-by: Denys Vlasenko <dvlasenk@redhat.com>
> CC: David Woodhouse <David.Woodhouse@intel.com>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Dan Carpenter <dan.carpenter@oracle.com>
> CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> CC: linux-mtd@lists.infradead.org
> CC: linux-kernel@vger.kernel.org

Applied to l2-mtd.git
