Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c3Eh-0006AC-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 13:14:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLAEIBFFAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLAEIBFFAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: "Dave Ellis" <DGE@sixnetio.com>, linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Aug 2002 13:14:47 +0100
Message-ID: <30768.1028636087@redhat.com>
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
>  BTW, is it neccesary to use spin_lock_bh()? Can we not get away with
> just spin_lock()? I am not very good at locking, but I think xxx_bh is
> only needed when interrupts can can execute the locked code and
> currently there are no interrupts in this code path(I think).

> Is it not true that xxx_bh() also disables interrupts? If so, there
> must be rather long periods with interrupts turned off in
> cfi_cmdset_xxxx.c?

spin_lock_bh() should not disable interrupts, only bottom-halves. It was 
used to protect against timers, because we intend(ed) to have the erase 
completion done from a timer. At the moment there's no real need to use 
anything but spin_lock().


--
dwmw2
