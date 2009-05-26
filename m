Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M96Lp-0004dT-Ls
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 23:46:40 +0000
Date: Wed, 27 May 2009 08:46:16 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH 1/3] mtd/maps: uclinux: allow systems to override map
	addr/size
Message-ID: <20090526234616.GC6295@linux-sh.org>
References: <20090526231902.GA6295@linux-sh.org>
	<1243380798-10089-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1243380798-10089-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, uclinux-dev@uclinux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 26, 2009 at 07:33:16PM -0400, Mike Frysinger wrote:
> +extern char _ebss;
> +
Also, it would be nice if the remaining architectures that define _ebss
could shove this in their asm/sections.h so we can kill this off from the
driver itself.
