Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vQs4-0001UA-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 22:42:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m38zketfse.fsf@DLT.linuxnetworx.com> 
References: <m38zketfse.fsf@DLT.linuxnetworx.com> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: interleave logic? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 May 2001 22:43:12 +0100
Message-ID: <17354.988926192@redhat.com>
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

ebiederman@lnxi.com said:
>  What do we have nasty half incomplete interleave logic all throughout
> the cfi code?

> It looks like it could be done more cleanly with a wrapper around the
> probe code, and a wrapper around the mapping driver. 

The chip driver needs to know about the interleave to some extent - it's 
got to be able to deal with errors on individual chips in the interleave. 
(How well we actually do that at the moment is a different question, of 
course.)

I thought the macros that were introduced (by Nico?) were roughly the right 
thing. If you have better suggestions, though, I'm interested.

--
dwmw2
