Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163fyV-0004tN-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 15:59:47 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0111131653040B.28381@jocke.lumentis.se> 
References: <0111131653040B.28381@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fwd: Cache mappings and invalidate 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Nov 2001 16:08:57 +0000
Message-ID: <15837.1005667737@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Joakim.Tjernlund@lumentis.se said:
>  Anybody care to comment on my experiment so far? 

Beware of the dma_cache_inv() and invalidate_dcache_range() functions. On 
some architectures they're stupidly misnamed and are in fact no-operations. 

Linus seems to think this is a Good Thing.


--
dwmw2
