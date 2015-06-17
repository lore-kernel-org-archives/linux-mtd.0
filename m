Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z52lz-0001NF-VH
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 02:08:16 +0000
Received: by pdjm12 with SMTP id m12so26818360pdj.3
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 19:07:52 -0700 (PDT)
Date: Tue, 16 Jun 2015 19:07:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/6] mtd: r852: Fix device_create_file() usage
Message-ID: <20150617020749.GE4917@ld-irv-0074>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433193054-26865-2-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, maximlevitsky@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 01, 2015 at 11:10:49PM +0200, Richard Weinberger wrote:
> device_create_file() can fail, therefore we have to
> handle this case and abort.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed the first 5. Still looking at the 6th.
