Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Albtr-0000Ud-VB
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 22:41:40 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>,
	Jarkko Lavinen <jarkko.lavinen@nokia.com>
Date: Wed, 28 Jan 2004 11:49:02 +1300
References: <20040127100613.GA16078@angel.research.nokia.com>
	<20040127134835.GA9404@angel.research.nokia.com>
	<1075216726.1633.125.camel@hades.cambridge.redhat.com>
In-Reply-To: <1075216726.1633.125.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040127224134.9F91515D43@desire.actrix.co.nz>
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 case insensitivity
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 28 January 2004 04:18, David Woodhouse wrote:

> > My primary concern was to estimate the cost or pain of implementing
> > file name case insensitivity and find arguments against doing it in
> > the kernel.
>
> It is fairly painful -- you have to provide your own dentry_ops for
> comparison and hashing, which mostly sorts out the evil dcache coherency
> issues we used to have with case-insensitivity.
>
> But you still have to know the character set. That was vaguely OK for
> FAT, where we had to play charset games anyway, but I _really_ don't
> want to have the JFFS2 code play with character sets and know that û is
> really the same as �?, etc. And don't get me started on Ŵ and ŵ :)
>
> You really ought to be able to do this in userspace.

I agree completely with David.

I had to add case insensitivity to YAFFS for WinCE.  There were enough wierd 
things just to make that work. On top of that, with Linux there is all the 
overhead of modifying dentry behaviour, handling renaming oddities etc. This 
is non-trivial to get right.

Doing this in user space is by far the easiest.

-- Charles
