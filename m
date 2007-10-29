Subject: Re: jffs2: too few erase blocks
From: David Woodhouse <dwmw2@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20071028180223.GB14076@mail.shareable.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
Content-Type: text/plain
Date: Sun, 28 Oct 2007 22:59:07 -0400
Message-Id: <1193626747.2915.87.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org,
	Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 2007-10-28 at 18:02 +0000, Jamie Lokier wrote:
> 
> If you call "fsync()" or "fdatasync()" after writing the data to a
> file, that is suppoe to ensure the data is written when the function
> returns.
> 
> That's supposed to happen, but I don't know if JFFS2 actually does
> that.
> 
> If you call fsync() on a directory handle, that traditionally ensures
> the file names in that directory are written.  So to be sure of
> creating a file and writing to it, you would create the file, write
> it, fsync() it, then open the directory containing the file and
> fsync() the directory.  For example, email delivery programs use that
> strategy before reporting to a sender that the email is safely stored.
> 
> But again, I don't know if JFFS2 actually does provide those
> assurances.

Yes, it does. In fact, on NOR flash you get entirely synchronous
behaviour even _without_ explicit syncs -- effectively the same as
MS_SYNC.

-- 
dwmw2
