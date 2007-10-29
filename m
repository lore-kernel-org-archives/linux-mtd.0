Subject: Re: jffs2: too few erase blocks
From: David Woodhouse <dwmw2@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20071029205125.GA27773@mail.shareable.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
	<20071029205125.GA27773@mail.shareable.org>
Content-Type: text/plain
Date: Mon, 29 Oct 2007 17:40:40 -0400
Message-Id: <1193694040.2915.123.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-10-29 at 20:51 +0000, Jamie Lokier wrote:
> When you say "sync", do fdatasync() / fsync() on open files and
> directories flush the necessary blocks from wbuf for those
> files/directories data and their inode metadata, for JFFS2?
> 
> I have been calling sync(), but I wonder if fdatasync/fsync do as they
> are supposed to?

They certainly should; if you find otherwise, please tell me.

-- 
dwmw2
