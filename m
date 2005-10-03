Received: from omx3-ext.sgi.com ([192.48.171.20] helo=omx3.sgi.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMShN-0000aZ-MT
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 16:57:54 +0100
Date: Mon, 3 Oct 2005 08:57:34 -0700 (PDT)
From: Christoph Lameter <clameter@engr.sgi.com>
To: Deepak Saxena <dsaxena@plexity.net>
In-Reply-To: <20051001050003.GD11137@plexity.net>
Message-ID: <Pine.LNX.4.62.0510030856250.8006@schroedinger.engr.sgi.com>
References: <20051001050003.GD11137@plexity.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [MTD] kmalloc + memzero -> kzalloc conversion
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Sep 2005, Deepak Saxena wrote:

 > We have the API, so use it.

Ummm. There is a patch in Andrew's tree that allows the use of __GFP_ZERO 
with slabs in the same way as the page allocator. With that functionality 
kmalloc_node will also be able to zero stuff.
