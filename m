From: David Woodhouse <dwmw2@infradead.org>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <20040127134835.GA9404@angel.research.nokia.com>
References: <20040127100613.GA16078@angel.research.nokia.com>
	 <1075202008.1633.26.camel@hades.cambridge.redhat.com>
	 <20040127134835.GA9404@angel.research.nokia.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1075216726.1633.125.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 15:18:47 +0000
Content-Transfer-Encoding: 8bit
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 case insensitivity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 15:48 +0200, Jarkko Lavinen wrote:
> User space people want the file name case insensitivity.  I guess the
> old files are likely to be selected from a list on an embedded device.
> However case insensitivity is a desirable feature when adding new file
> names.

What do you mean, precisely? You're still describing the imagined
solution rather than the problem.

Case sensitivity is more clearly applicable in _lookup_ -- when trying
to find a given file from its name.

In the case of file _creation_, that affects the collision detection --
case insensitivity will usually cause you to be forbidden from creating
a new file with a name which differs from an existing name only in case.

Is that what they want it for? Why -- what is the real source of the
requirement?

> My primary concern was to estimate the cost or pain of implementing
> file name case insensitivity and find arguments against doing it in
> the kernel.

It is fairly painful -- you have to provide your own dentry_ops for
comparison and hashing, which mostly sorts out the evil dcache coherency
issues we used to have with case-insensitivity. 

But you still have to know the character set. That was vaguely OK for
FAT, where we had to play charset games anyway, but I _really_ don't
want to have the JFFS2 code play with character sets and know that û is
really the same as Û, etc. And don't get me started on Ŵ and ŵ :)

You really ought to be able to do this in userspace. 

-- 
dwmw2
