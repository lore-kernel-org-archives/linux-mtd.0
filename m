Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ciLd-0004MR-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:08:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLMEJEFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLMEJEFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: "Dave Ellis" <DGE@sixnetio.com>, linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 09:08:42 +0100
Message-ID: <28529.1028794122@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  You can move the wake_up() call up one step(xxxx_write_words()) and
> call it just before  you leave that function. I tried that and it's a
> improvement(note, I using buffer writes, so word writes should see an
> even better improvement), but that will also hold reads back(not that
> I noticed anything) until xxx_write_words has completed.  We can fix
> that by having separate wait queues for read and erase. 

Aren't reads held back anyway for the same reason that erases are -- by the 
time we actually schedule after waking them, the chip is in FL_WRITING 
again?

What happens if you stick a cond_resched() immediately after the wake_up() 
(ok, after the spin_unlock).?

--
dwmw2
