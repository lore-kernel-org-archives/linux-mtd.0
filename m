Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zxpu-0007VT-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 19:04:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <2702075D4DE2B043BF5EB82E9CFAD45B0BD37B@mail1.mediatrix.com> 
References: <2702075D4DE2B043BF5EB82E9CFAD45B0BD37B@mail1.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Memory leak problem with JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 19:04:35 +0100
Message-ID: <25738.1028138675@redhat.com>
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

fgiasson@mediatrix.com said:
> You have the right procedure to reproduce the problem ( vmstat ; while
> true ; do mount -t jffs2 mtd0 /mnt/spare ; ).  I can reproduce the
> problem using this line on my system.

> I updated my JFFS2 code with the lastest from CVS, and I am using
> kernel 2.4.19-rc2, and the problem is still there.  Do you think you
> could do the same test under 2.4.19-rc2?

I'll have a go. This happens in the CVS code, not the jffs2-2_4-branch 
code, right?

--
dwmw2
