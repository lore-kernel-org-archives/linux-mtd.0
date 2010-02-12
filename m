Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nfuft-0005kV-By
	for linux-mtd@lists.infradead.org; Fri, 12 Feb 2010 12:31:14 +0000
In-Reply-To: <DIIE.00001DD8002443BF@mail.auerswald.de>
References: <DIIE.00001DD8002443BF@mail.auerswald.de>
Subject: Re: Why erase_pending_blocks in write_super? (was: [PATCH]
	JFFS2:	Erase max 3 EB's in ...)
To: "Kai-Uwe Bloem" <kai-uwe.bloem@auerswald.de>
Message-ID: <OF36A0B5DE.926C06F6-ONC12576C8.004392D1-C12576C8.0044B7AA@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 12 Feb 2010 13:30:34 +0100
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

>
> Hi,
>
> I have been in touch with Joakim and Artem about this for some mails, but now
> I would like to ask the jffs2 experts about this.
>
> Is jffs2_erase_pending_blocks real the right thing to do in jffs_write_super?
>
> First, there's nothing like a super block in JFFS2, and the linux kernel's VFS
> documentation states that jffs2_write_super is an optional method. Hence, I
> think it's not technically necessary to have this method for jffs2.
>
> From Artem I learned that it was once introduced to flush the write buffer,
> using the timers in the VFS layers instead of implementing local timers in
> jffs2. That's a good explanation for having an implementation of write_super at all.
>
> I can also understand why there is a GC trigger here. GC is an optimization,
> and as such it should be triggered often enough for it do do the work.
>
> But, why is this jffs_erase_pending_blocks in there?
>
> In NOR case, after having rm'ed a large file, there are possibly a load of
> blocks on the pending list. The effect I notice is the same as Joakim noticed:
> after the rm, the system blocks for a while. Depending on the size of the
> file, this "while" might be rather long. I measured up to 30 seconds, which
> wreaks havoc with the innards of our userland software. And no, I can't change
> this by altering the process priority.

Just a note here to you, I only see these delays at umount time. A rm in normal
operation doesn't block. This is because my NOR flash supports erase suspend.
If you see this during normal operation it is because your flash/driver doesn't
support erase suspend. cms_set0002 just recently got support for erase suspend.

>
> So, can you please enlighten me? What's the advantage of having the pending
> list erased in write_super? Can I possibly remove it without experiencing
> other problems?

Me too wants to know :)
