Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JtXt-0002QU-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 11:15:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200206170954.g5H9s1JJ003771@blooper.utfors.se> 
References: <200206170954.g5H9s1JJ003771@blooper.utfors.se>  <0111121314140A.28381@jocke.lumentis.se> <02022614424803.15969@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] scan.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 11:15:36 +0100
Message-ID: <20935.1024308936@redhat.com>
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
> I was sure that I sent this one long time ago, but my mind must play
> tricks on me.

> Do not scan blocks which just contain a CLEANMARKER, it's a waste of
> CPU cycles.

I'd rather we still scanned them, but deferred it till later -- as long as
it gets done before we actually try to write to them, that's fine.

We can go one better than that -- we can avoid doing the crc32 check on 
data nodes during mount. As as we do it in read_inode(), and we do _all_ 
inodes before actually starting to garbage-collect, we don't have to make 
the user wait for it during mount.

I tried both of these last week (well, actually I just disabled the crc32 
without doing it later), and the latter gave more of an improvement. If we 
skip the building up of fragment lists during mount too, it'll probably get 
even faster.

Of course, the two things that gave me the best improvement in mount time 
were fixing the inocache_last optimisation, and then just increasing 
INOCACHE_HASHSIZE to 128. The latter rendered the whole inocache_last 
optimisation pointless, btw.

--
dwmw2
