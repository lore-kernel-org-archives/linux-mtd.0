Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEmfj-0004IX-I7
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 21:53:35 +0000
Received: by mail-pd0-f170.google.com with SMTP id g10so2051205pdj.1
 for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2014 14:53:09 -0700 (PDT)
Date: Tue, 5 Aug 2014 14:53:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: allow retry/timeout loop to exit
Message-ID: <20140805215305.GK3711@ld-irv-0074>
References: <1405994779-19207-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1405994779-19207-1-git-send-email-computersforpeace@gmail.com>
Cc: Bean Huo <beanhuo@outlook.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 21, 2014 at 07:06:19PM -0700, Brian Norris wrote:
> The variable 'retries' is never modified, so if the reset operation
> never is going to complete, we'll get stuck in an infinite loop.
> 
> It looks like the intention was to decrement 'retries' on every loop.
> Untested.
> 
> Caught by Coverity.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed this and my other Coverity-inspired patches to l2-mtd.git/next.

Brian
