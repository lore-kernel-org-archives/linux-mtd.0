Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A758-0002aI-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 10:09:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0111300921440.13550-200000@newbast.lynuxworks.com> 
References: <Pine.LNX.4.33.0111300921440.13550-200000@newbast.lynuxworks.com> 
To: Aleksander Sanochkin <asanochkin@Lnxw.COM>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS1 scan procedure 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 10:19:48 +0000
Message-ID: <16812.1007201988@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

asanochkin@Lnxw.COM said:
> I've been using JFFS1 for some time and faced a problem that the JFFS1
> scan procedure is not robust enough. Namely, it expects that the flash
> region it scans is either erased or is in a state left by JFFS1
> itself.  That is, it doesn't expect that the flash is containing a
> "garbage", which can be the case sometimes.

This looks sane to me, although I'll admit that JFFS1 is a vague and 
distant memory - I have enough trouble remembering the details of JFFS2 :)

Unless someone else objects to it shortly, feel free to go ahead and commit
it. Please could I ask you to make the layout of the new code match what was
there already though? Curly braces on the same line as the if() statement, 
etc. I'll refrain from being pedantic about printks without priorities as 
that _does_ actually match the existing code :)




--
dwmw2
