Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhK0w-0005LT-IV
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 09:46:47 +0000
Subject: Re: [PATCH 1/2] jffs:2 Move erasing from write_super to GC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFAA60FE5A.4E16F45A-ONC12576CC.003285C2-C12576CC.0033188F@transmode.se>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266310672.11659.197.camel@localhost>
	<OFAA60FE5A.4E16F45A-ONC12576CC.003285C2-C12576CC.0033188F@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 11:45:35 +0200
Message-ID: <1266313535.11659.203.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-16 at 10:18 +0100, Joakim Tjernlund wrote:
> > Also, I think you should call it with count = 1, so that you would erase
> > only one EB at one iteration. This way you will let the GC thread do
> > other things with less latency as well.
> 
> If we reduce the count to 1 one might just as well remove count from
> jffs2_erase_pending_blocks() and make it just erase one block on each invocation,
> not sure I like that as it will be more overhead when erasing many blocks.
> 
> I figure erasing blocks is the most rewarding form of GC so there should
> be no need to reduce latency for other things, can you think of a reason?

Hmm, yes, you are right. Please, discard my "erase only 1" suggestion.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
