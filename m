Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bKyx-00045Z-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 12:27:23 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020214133223.A26200@wohnheim.fh-wedel.de> 
References: <20020214133223.A26200@wohnheim.fh-wedel.de>  <3C1FD0DD.9A4F2CC8@comdev.cc> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: Adam Wozniak <adam.wozniak@comdev.cc>, linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Feb 2002 12:38:24 +0000
Message-ID: <9375.1013690304@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  __raw_readll is not defined in our kernel (2.4.2 based). Worse, I
> couldn't find that definition in the 2.4.17 kernel, either. Is this
> specific to your private kernel? 

I fixed this yesterday, for most people at least. The 64-bit stuff was being
included even if you didn't explicitly turn it on. Now you do have to turn 
it on - and if you do, you're expected to provide a read64/write64 that 
works somehow.

--
dwmw2
