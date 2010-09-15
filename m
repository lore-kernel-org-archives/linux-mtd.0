Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ovmed-000383-D4
	for linux-mtd@lists.infradead.org; Wed, 15 Sep 2010 07:43:44 +0000
Received: by bwz19 with SMTP id 19so366239bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Sep 2010 00:43:42 -0700 (PDT)
Subject: Re: [PATCH 2/7] mtd: autoconvert trivial BKL users to private mutex
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <1284494022-7346-3-git-send-email-arnd@arndb.de>
References: <1284494022-7346-1-git-send-email-arnd@arndb.de>
	<1284494022-7346-3-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Sep 2010 10:42:06 +0300
Message-ID: <1284536526.25181.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-14 at 21:53 +0200, Arnd Bergmann wrote:
> All these files use the big kernel lock in a trivial
> way to serialize their private file operations,
> typically resulting from an earlier semi-automatic
> pushdown from VFS.
> 
> None of these drivers appears to want to lock against
> other code, and they all use the BKL as the top-level
> lock in their file operations, meaning that there
> is no lock-order inversion problem.
> 
> Consequently, we can remove the BKL completely,
> replacing it with a per-file mutex in every case.
> Using a scripted approach means we can avoid
> typos.
> 

Looks good, are you going to merge them all yourself or you want this to
go via the mtd tree?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
