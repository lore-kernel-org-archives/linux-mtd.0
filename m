Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169pjk-0001CK-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 15:38:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <OFC89DF372.F3CC9069-ON85256B14.00554933@nitsuko.com> 
References: <OFC89DF372.F3CC9069-ON85256B14.00554933@nitsuko.com> 
To: MQuicquaro@necinfrontia.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: No space on jffs2 fs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Nov 2001 15:48:27 +0000
Message-ID: <6410.1007135307@redhat.com>
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

MQuicquaro@necinfrontia.com said:
>  Thanks for the help. So in essence what you are telling me is that
> since the block size of my flash part is 256K, then the smallest jffs2
> file system that I can have is 5*256K or 1.25 MB?

That's the smallest file system you can have without actually putting any 
data on it. You need 1.25MiB _above_ the amount of space actually taken by 
the data. 

This can be reduced. I'm just being overly conservative until I can prove 
that it's safe.

--
dwmw2
