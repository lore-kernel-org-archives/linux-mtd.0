Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192p5l-0001vh-37
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 10:08:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3E928CB5.5010306@imc-berlin.de>
References: <3E927803.9060205@imc-berlin.de>
	 <1049790098.18045.91.camel@passion.cambridge.redhat.com>
	 <3E928954.1080504@imc-berlin.de>
	 <1049791383.18045.144.camel@passion.cambridge.redhat.com>
	 <3E928CB5.5010306@imc-berlin.de>
Message-Id: <1049792915.18045.223.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 10:08:35 +0100
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

On Tue, 2003-04-08 at 09:47, Steven Scholz wrote:
> But the performance improvements lately done on the JFFS2 code is in 
> there!?

No. Nothing new is in there -- possibly not even the fixes to get
mtime/nlink on directories right.
 
> So for production systems I should patch my 2.4.20 with the 
> jffs2-2_4-branch !?

That's the official answer, yes. In practice, you'll generally be OK on
CVS head, and it hasn't had much done to it recently that's going to
make it break.

-- 
dwmw2
