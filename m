Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Nbor-0004rG-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 16:03:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F9102D41F595D311ACA7009027DE2C84033D4D81@c3po.heurikon.com> 
References: <F9102D41F595D311ACA7009027DE2C84033D4D81@c3po.heurikon.com> 
To: "McNutt, Scott" <smcnutt@artesyncp.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Magic bitmask 0x1985 not found 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Jul 2001 16:09:38 +0100
Message-ID: <18479.995641778@redhat.com>
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

smcnutt@artesyncp.com said:
>  I thought I used 131072. But based on the dump, I must have
> fat-fingered 131071 :-(. I made a new image with -e 131072 and it
> looks good.

Er, yes, that would confuse it quite a lot. Perhaps we ought to make 
mkfs.jffs2 reject values which aren't a power of two?

--
dwmw2
