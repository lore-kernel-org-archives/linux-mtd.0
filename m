Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1756UL-0004fQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 16:02:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020506151930.A15109@kosh.hut.fi> 
References: <20020506151930.A15109@kosh.hut.fi>  <20020503201900.A32761@kosh.hut.fi> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <20020503201900.A32761@kosh.hut.fi> <28528.1020448474@redhat.com> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 May 2002 16:02:06 +0100
Message-ID: <25024.1020783726@redhat.com>
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

jlavi@iki.fi said:
>  I have caught the message 8 times. It doesn't occur rather seldom
> when I have been benchmarking JFFS2 over the weekend.

> On five cases the first line was "Unknown INCOMPAT nodetype C002 at
> 0020293C" (address varies). 

Er, this means it's marked as obsolete on the flash but not in memory. I 
have a vague recollection of having seen this and worked out the cause. 
Is this with the latest code from the jffs2-2_4-branch of CVS? Does it also 
happen with the trunk code?

>  Do you mean kernel profiling? I am using JFFS2 on an Arm based device
> and  kernel profiling is not available for Arm or is it?

Yes. Kernel profiling should work fine on ARM. 

--
dwmw2
