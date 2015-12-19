Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA5q5-0000Wt-Ht
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2015 00:57:38 +0000
Received: by mail-pa0-x22b.google.com with SMTP id ur14so68114268pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 16:57:17 -0800 (PST)
Date: Fri, 18 Dec 2015 16:57:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Cc: linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1 linux-next] mtd: cfi_cmdset_0002: use swap() in
 cfi_cmdset_0002()
Message-ID: <20151219005714.GY10460@google.com>
References: <1433953893-23547-1-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433953893-23547-1-git-send-email-fabf@skynet.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Garbage collecting old patches...

On Wed, Jun 10, 2015 at 06:31:32PM +0200, Fabian Frederick wrote:
> Use kernel.h macro definition.
> 
> Thanks to Julia Lawall for Coccinelle scripting support.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Applied to l2-mtd.git
