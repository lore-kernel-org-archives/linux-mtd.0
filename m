Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJRJp-0006ej-GG
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 04:30:01 -0500
Subject: Re: Why is PEB not erased before writing???
From: Thomas Gleixner <tglx@linutronix.de>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
References: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 20 Feb 2007 10:34:28 +0100
Message-Id: <1171964069.30834.220.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-02-20 at 12:07 +0530, Brijesh Singh wrote:
> I tried to overwrite same block.
> Ubi should call erase before overwriting the data block.But it didn't.
> UBI simply wrote the block again.That will write garbage for a flash.
> So who will call erase??Is it the application's responsibility to call
> erase before writing at same  location???
> 
> I am stuck here because my concept was,
> ubi will check if we are re-writing the same PEB.
> If yes,UBI will erase the block and then write the same block.

Applications and UBI kernel users have no access to physical erase
blocks. They look at logical erase blocks. UBI manages the translation
of logical to physical blocks. If you write to the same logical erase
block again UBI will just write to a different physical erase block and
erase the previous PEB later on. The internal management guarantees that
the application looks only at the newest written block and not at the
older one.

	tglx
