Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joj5a-0002m1-Cs
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 17:49:02 +0000
Date: Wed, 23 Apr 2008 18:48:58 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: JFFS2 powerfail ?
Message-ID: <20080423174858.GA12903@shareable.org>
References: <1531E53627F1F749B4FE809BF2A4EB674AF845@WETMEX10.loepfe.com>
	<1208964812.11721.81.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208964812.11721.81.camel@sauron>
Cc: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> > JFFS2 notice: (791) check_node_data: wrong data CRC in data node at 0x01062120: read 0xfac2f85a, calculated 0x9ac0c6d1.
> > JFFS2 notice: (791) check_node_data: wrong data CRC in data node at 0x002b9bf0: read 0x9f182fab, calculated 0x4ad20e5f.
> > JFFS2 notice: (791) check_node_data: wrong data CRC in data node at 0x002b5d60: read 0x79a2a9d8, calculated 0x35234c9a.
> 
> This is normal. It's just half-written nodes which correspond to the
> last writes you made before the power cut. They are harmless, although
> spam the syslog. JFFS2 cannot remove them straight after mount, so they
> may accumulate. Which means each time you see corruption messages for
> the previous unclean reboots. However, the corrupted nodes will go away
> some time, when JFFS2 decides to garbage-collect corresponding
> eraseblocks. IOW, don't worry, this is a feature.

If they are going to be removed at the next GC, it would be nice to
remove them earlier by overwriting them with all-1s - would that work?

I'm thinking of the case where device spews a page of CRC errors on
every boot for a long time, until you until you write enough data to
the filesystem that it reclaims these blocks - which you might not do
for a long time (if ever).

(Alternatively, can triggering a background GC clean them up reliably?)

After all, there might be application level recovery for partially
written files, but that won't clean up the incomplete nodes.

-- Jamie
