Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175ArE-00052X-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 20:42:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020507204659.A20246@kosh.hut.fi> 
References: <20020507204659.A20246@kosh.hut.fi>  <20020506151930.A15109@kosh.hut.fi> <20020503201900.A32761@kosh.hut.fi> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <20020503201900.A32761@kosh.hut.fi> <28528.1020448474@redhat.com> <20020506151930.A15109@kosh.hut.fi> <25024.1020783726@redhat.com> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 May 2002 20:42:11 +0100
Message-ID: <7557.1020800531@redhat.com>
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
>  The code was not the latest and I really hope I am not causing a
> wrong alarm. Kernel 2.4.15, JFFS2 and mtd code from 11 February 2002
> snapshot  in ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/. 

Forgive me - my brain goes in and out of phase with JFFS2, and it's mostly 
out at this point. Thomas seems generally more clueful than I.

Version 1.63 of scan.c contains what was intended to be an optimisation (from
Joakim Tjernlund), but which should also have the effect of preventing 
obsolete nodes from ending up on the lists. That's in the trunk code but 
not the jffs2-2_4-branch.

--
dwmw2
