Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKxlm-00008b-Dt
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 08:44:30 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j8TCi9Ml014263
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 08:44:09 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j8TCi9VU097530
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 08:44:09 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j8TChxVr007004
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 08:43:59 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Zhonglin <zhonglinzh@mobilesoft.com.cn>
In-Reply-To: <433A54EB.4060900@mobilesoft.com.cn>
References: <433A54EB.4060900@mobilesoft.com.cn>
Content-Type: text/plain
Date: Thu, 29 Sep 2005 07:43:39 -0500
Message-Id: <1127997819.3231.8.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Error or Maybe Flash Driver Error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-09-28 at 16:31 +0800, Zhonglin wrote:
> Hi All,
> 
> I pulled the JFFS2 code from CVS.  And Ported 2.6.12-omap1 to p2-sample.
> When P2 sample run for a while, Sometimes The following message will show.
> 
> But when I boot again, it is ok again. 
> 
> Does anybody meet the same problem ?
> 
> 
> Node CRC 00800080 != calculated CRC 4bf2ff8d for node at 00676518
> JFFS2 notice: (247) read_unknown: node header CRC failed at 0x9dfa60.
> But it must have been OK earl.Node totlen on flash (0x00800080) !=
> totlen from node ref (0x0000059c)

I have seen this problem, yes.  Specifically, it has shown up when I try
to mount a JFFS2 filesystem as the rootfs.  When mounting it as a
non-rootfs, I haven't seen the problem.  I doubt that really makes a
difference though, and it's probably related more to timing than
anything.

> So could anyone give me to fix the bug ??

I haven't figure it out yet.  My particular case never has the resume
code called, so I'm not sure that's the problem.

josh
