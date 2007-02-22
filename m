Received: from smtp.osdl.org ([65.172.181.24])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HK1z6-0002to-C6
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 19:38:59 -0500
Date: Wed, 21 Feb 2007 16:38:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 4/4] NOMMU: Make it possible for RomFS to use MTD
	devices directly
Message-Id: <20070221163839.b4f5e3b5.akpm@linux-foundation.org>
In-Reply-To: <20070220195106.26186.41931.stgit@warthog.cambridge.redhat.com>
References: <20070220195049.26186.69393.stgit@warthog.cambridge.redhat.com>
	<20070220195106.26186.41931.stgit@warthog.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Feb 2007 19:51:06 +0000
David Howells <dhowells@redhat.com> wrote:

> +		brelse(bh);

A little fyi: brelse() is rather old-fashioned, and has a usually unneeded
test for non-null bh in it.  In situations where we know that the pointer is 
valid, let's please use put_bh().

Anyway, I'll assume that dwmw2 will be handling this patch series.
