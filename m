Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oh4-0001ZZ-FY
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:43:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3E928954.1080504@imc-berlin.de>
References: <3E927803.9060205@imc-berlin.de>
	 <1049790098.18045.91.camel@passion.cambridge.redhat.com>
	 <3E928954.1080504@imc-berlin.de>
Message-Id: <1049791383.18045.144.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 09:43:04 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: Inode corrupted after CVS update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-04-08 at 09:33, Steven Scholz wrote:
> So how stable is the MTD/JFFS2 code anyway?
> Is the CVS the only place for me to get the source?
> Or are there some offical, release patches?

The jffs2-2_4-branch from CVS, which is in Marcelo's latest 2.4.21-pre,
is the one that's _really_ intended to be stable -- but that's because
we don't make any exciting changes there at all.

The CVS HEAD is normally _fairly_ stable, and when I have time I push it
into the handhelds.org tree so that I inflict it on an army of
iPAQ-using victims^Wtesters. The error in the previous version didn't
show up because I didn't test with device nodes -- we use devfs on the
iPAQ.

If you want to track -HEAD it's worth keeping an eye on the IRC channel
-- if Thomas and I are spending the day discussing how best to fix
stuff, and there's a lot of swearing and debugging going on, then it's
probably not a good time to update :)

-- 
dwmw2
