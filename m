Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JvQc-0002ak-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 13:16:14 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] scan.c 
Date: Mon, 17 Jun 2002 14:16:13 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEKJFEAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20935.1024308936@redhat.com>
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
> > I was sure that I sent this one long time ago, but my mind must play
> > tricks on me.
> 
> > Do not scan blocks which just contain a CLEANMARKER, it's a waste of
> > CPU cycles.
> 
> I'd rather we still scanned them, but deferred it till later -- as long as
> it gets done before we actually try to write to them, that's fine.

Why do you still want to scan them? It's safe not to by design. Maybe
as a debug opion?

> 
> We can go one better than that -- we can avoid doing the crc32 check on 
> data nodes during mount. As as we do it in read_inode(), and we do _all_ 
> inodes before actually starting to garbage-collect, we don't have to make 
> the user wait for it during mount.

yes, this is what I tested(skipping the crc32 check) some time ago and I 
noticed a big improvement. I also noticed that adler32 was much faster
than crc32(btw you should not use 0 as start seed to the crc32 since that
will yield a correct csum(0) on a zeroed buffer).
Is it safe to do skip the CRC check in the 2.4 branch as well? 

I have an addon idea: Add a new flag to node.nodetype.
This flag is set when a node is first written to the flash. The first time
the node is read the CRC is calculated and if the CRC:s match, clear
the CRC flag(on the flash as well). The next time the same node is 
read you don't have to check the CRC again since it has already
been verified. That will save a lot of CPU cycles during file I/O as well. 

> 
> I tried both of these last week (well, actually I just disabled the crc32 
> without doing it later), and the latter gave more of an improvement. If we 
> skip the building up of fragment lists during mount too, it'll probably get 
> even faster.
> 
> Of course, the two things that gave me the best improvement in mount time 
> were fixing the inocache_last optimisation, and then just increasing 
> INOCACHE_HASHSIZE to 128. The latter rendered the whole inocache_last 
> optimisation pointless, btw.

128! In my 2.4.2 kernel(from Montavista) I can not go higher than
13, then it Oops on me.

> 
> --
> dwmw2

 Jocke
