Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NvMJ-00063r-00
	for <linux-mtd@lists.infradead.org>; Sat, 21 Jul 2001 12:55:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010720173422.18538.qmail@nwcst284.netaddress.usa.net> 
References: <20010720173422.18538.qmail@nwcst284.netaddress.usa.net> 
To: Eric <ebrower@usa.net>
Cc: Tim Hockin <thockin@sun.com>,
    MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [Re: [structure field names] ] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Jul 2001 13:01:26 +0100
Message-ID: <30757.995716886@redhat.com>
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

ebrower@usa.net said:
>   In the case of the MEMREADOOB and MEMWRITEOOB ioctls, we still must
> do conversions so that the u8* is understood by the kernel to be a
> 32-bit userspace pointer and not a 64-bit kernelspace pointer. 

I don't like the MEMREADOOB and MEMWRITEOOB ioctls very much. I'm severely 
tempted to deprecate them and have a separate device for OOB space access. 
Does anyone ever actually use the /dev/mtdr<n> read-only devices?


>  I only brought this up because if the structure member names are
> modified, they must be modified in the sparc64 patch as well.  This
> is, unfortunately, a required headache.

I am sympathetic to Tim's request, but at this stage I think the pain of 
changing names probably outweighs the benefit.

--
dwmw2
