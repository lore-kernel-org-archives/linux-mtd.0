Received: from mx2.redhat.com ([66.187.237.31])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8YE2-00053P-0Z
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 10:47:58 +0000
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20081205030806.32225.66382.stgit@marcab.local.tull.net>
References: <20081205030806.32225.66382.stgit@marcab.local.tull.net>
To: Nick Andrew <nick@nick-andrew.net>
Subject: Re: [PATCH] Fix incorrect use of loose in fs.c
Date: Fri, 05 Dec 2008 10:47:51 +0000
Message-ID: <16075.1228474071@redhat.com>
Sender: dhowells@redhat.com
Cc: David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>, dhowells@redhat.com,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nick Andrew <nick@nick-andrew.net> wrote:

> Fix incorrect use of loose in fs.c
> 
> It should be 'lose', not 'loose'. Also fix a spelling error.
> 
> Signed-off-by: Nick Andrew <nick@nick-andrew.net>

Acked-by: David Howells <dhowells@redhat.com>
