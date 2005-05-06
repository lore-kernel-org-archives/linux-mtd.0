Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTyxb-0007pi-UI
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 05:17:29 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
In-Reply-To: <f6d0cd060505060203609f2f05@mail.gmail.com>
References: <f6d0cd0605050523271574d91c@mail.gmail.com>
	<1115365247.27158.9.camel@sauron.oktetlabs.ru>
	<f6d0cd060505060203609f2f05@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 06 May 2005 13:16:55 +0400
Message-Id: <1115371015.27158.18.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Warning during GC, resulting in to Magic Bitmask Error for
	JFFS2.
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> When i delete a file when the JFFS2 partition is full, i get an error 
> "jffs2_reserve_space(): Low on dirty space to GC, but it's a deletion.
> Allowing."
I'm not sure printing this message is a brilliant idea, but it is
harmless. Deletion in JFFS2 means writing new deletion nodes, which also
require some space. Your filesystem is stuffed fully, and there is no
space to write. But since writes are *deletions*, JFFS2 uses the blicks
which are reserved for GC to write these deletion nodes. And it prints
the messages you've observed.

> But if i give the command "sync" then it works fine after booting
> otherwise it gives me following error for sometime and then it mounts
> the JFFS2 partition.
Surely you reboot your board uncleanly, i.e., without cleanly unmounting
it?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
