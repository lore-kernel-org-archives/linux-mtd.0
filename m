Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aXzh-0003AN-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 09:41:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200208021020.47923.jens.nixdorf@embesso.com> 
References: <200208021020.47923.jens.nixdorf@embesso.com> 
To: Jens Nixdorf <jens.nixdorf@embesso.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC will formatted again and again 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Aug 2002 09:41:07 +0100
Message-ID: <25819.1028277667@redhat.com>
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

jens.nixdorf@embesso.com said:
>  i've send this posting some days before, but didn't get an answer and
>  also didn't found a solution somewhere else. Therefore i send my
> question again: 

You need to ensure the offending blocks are _marked_ as bad so we don't try 
to format them again. Not sure why we don't do that anyway when the format 
fails.

Where did you get nftl_format and how are you trying to run it?

--
dwmw2
