Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhLy2-00060m-3D
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 11:51:55 +0000
In-Reply-To: <1266313535.11659.203.camel@localhost>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1266310672.11659.197.camel@localhost>
	<OFAA60FE5A.4E16F45A-ONC12576CC.003285C2-C12576CC.0033188F@transmode.se>
	<1266313535.11659.203.camel@localhost>
Subject: Re: [PATCH 1/2] jffs:2 Move erasing from write_super to GC.
To: dedekind1@gmail.com
Message-ID: <OFFB9662B3.8400DCA7-ONC12576CC.003F62F7-C12576CC.0040EE91@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 16 Feb 2010 12:49:13 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/16 10:45:35:
>
> On Tue, 2010-02-16 at 10:18 +0100, Joakim Tjernlund wrote:
> > > Also, I think you should call it with count = 1, so that you would erase
> > > only one EB at one iteration. This way you will let the GC thread do
> > > other things with less latency as well.
> >
> > If we reduce the count to 1 one might just as well remove count from
> > jffs2_erase_pending_blocks() and make it just erase one block on each invocation,
> > not sure I like that as it will be more overhead when erasing many blocks.
> >
> > I figure erasing blocks is the most rewarding form of GC so there should
> > be no need to reduce latency for other things, can you think of a reason?
>
> Hmm, yes, you are right. Please, discard my "erase only 1" suggestion.

OK.

Both you and Kai-Uwe wants back jffs2_erase_pending_trigger() so I will
redo this part.

 Jocke

BTW, I see UBIFS is using CRC16 as well as CRC32. Is there a reason
you are using CRC16 in UBIFS. Any particular reason for that? CRC16 is
much slower than crc32 in linux since the CRC32 impl. was optimized
by yours truly long time ago just because it was impacting mount time
for JFFS2.

   Jocke
