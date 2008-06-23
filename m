Received: from smtpout.cs.fsu.edu ([128.186.122.75] helo=mail.cs.fsu.edu)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KAtcP-0008Rg-Tn
	for linux-mtd@lists.infradead.org; Mon, 23 Jun 2008 21:30:34 +0000
Received: from [192.168.16.174] (unknown [192.168.16.174])
	by mail.cs.fsu.edu (Postfix) with ESMTP id EFCB3F2985
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Jun 2008 17:32:30 -0400 (EDT)
Message-ID: <4860173F.4040304@cs.fsu.edu>
Date: Mon, 23 Jun 2008 17:35:59 -0400
From: Sarah Diesburg <diesburg@cs.fsu.edu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: inftl and diskonchip 2000 256MB
References: <Pine.LNX.4.62.0806201305110.20473@diablo.cs.fsu.edu>
In-Reply-To: <Pine.LNX.4.62.0806201305110.20473@diablo.cs.fsu.edu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sarah Diesburg wrote:

> output of "modprobe inftl" (starts with block 10, goes all the way to 
> block 11166)
> ...
> INFTL: formatting chain at block 7435
> INFTL: formatting block 7435
> INFTL: corrupt block 7436 in chain 
> 7436, chain length 0, erase mark 0xffff?
> INFTL: formatting chain at block 7436
> INFTL: formatting block 7436
> INFTL: corrupt block 7437 in chain 
> 7437, chain length 0, erase mark 0xffff?
> ...

I'm still getting this "corrupt block" error for almost every single
block on each modprobe of inftl, even with my backup chip installed.
I'm slowly crawling through the code, but can anyone offer any obvious
advice on what may be wrong?

Thanks for any suggestions at all!
-- Sarah

-- 
Sarah Diesburg
Florida State University
"I've got so many kernels I can start making popcorn!"
