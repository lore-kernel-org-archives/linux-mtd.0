Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kx77I-0007N8-Kx
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 21:37:45 +0000
Date: Mon, 3 Nov 2008 13:37:22 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] m25p80: fix detection of m25p16 flashes
Message-Id: <20081103133722.56bcf9a1.akpm@linux-foundation.org>
In-Reply-To: <1225396786-23679-1-git-send-email-vapier@gentoo.org>
References: <1225286467-17955-1-git-send-email-vapier@gentoo.org>
	<1225396786-23679-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: g.chen@freescale.com, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, Michael.Hennerich@analog.com,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Oct 2008 15:59:46 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> Commit d0e8c47c58575b9131e786edb488fd029eba443e added support for extended ids

Quoting a bare hash in the changelog is a bit reader-hostile and I
believe there's some git-related issue which can cause people to not be
able to find the commit at all (I'm not sure what the circumstances
are, but Linus has mentioned it a couple of times when asking people to
not quote bare commit IDs in changelogs).

So when referencing a previous commit please use this form:

   Commit d0e8c47c58575b9131e786edb488fd029eba443e ("m25p80.c
   extended jedec support").

Thanks.
