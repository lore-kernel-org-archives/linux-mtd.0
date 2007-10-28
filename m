Received: from mail.shareable.org ([81.29.64.88])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImFfY-0007jh-6y
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 17:27:46 -0400
Date: Sun, 28 Oct 2007 18:02:23 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Duke <ezbonites@gmail.com>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071028180223.GB14076@mail.shareable.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Duke wrote:
> Just to clarity myself a bit here. There is nothing stopping me from
> using the cp or mv (or any other file modification command for that
> matter) to update one directory but I would like to be able to verify
> the data is actually written and I thought perhaps mtd_debug or some
> other mtd tool might be able to verify this. Maybe it's not maybe it
> is, I would like to find out.

If you call "fsync()" or "fdatasync()" after writing the data to a
file, that is suppoe to ensure the data is written when the function
returns.

That's supposed to happen, but I don't know if JFFS2 actually does
that.

If you call fsync() on a directory handle, that traditionally ensures
the file names in that directory are written.  So to be sure of
creating a file and writing to it, you would create the file, write
it, fsync() it, then open the directory containing the file and
fsync() the directory.  For example, email delivery programs use that
strategy before reporting to a sender that the email is safely stored.

But again, I don't know if JFFS2 actually does provide those assurances.

-- Jamie
