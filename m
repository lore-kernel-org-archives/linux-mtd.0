Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163gt5-0004xn-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 16:58:15 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Fwd: Cache mappings and invalidate 
Date: Tue, 13 Nov 2001 18:05:45 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLEEPJEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15837.1005667737@redhat.com>
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

> 
> Joakim.Tjernlund@lumentis.se said:
> >  Anybody care to comment on my experiment so far? 
> 
> Beware of the dma_cache_inv() and invalidate_dcache_range() functions. On 
> some architectures they're stupidly misnamed and are in fact no-operations.

OK, just checked my arch(MPC860) and they are implemented. Are there
other functions that I should used instead? 
 
> 
> Linus seems to think this is a Good Thing.
hmm, why should this be a Good Thing?


 Jocke
> 
> 
> --
> dwmw2
