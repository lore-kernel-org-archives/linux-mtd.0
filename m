Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160shy-0006st-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 22:59:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7DF7BFDC95ECD411B4010090278A44CA1B73DC@ATVX> 
References: <7DF7BFDC95ECD411B4010090278A44CA1B73DC@ATVX> 
To: "Siders, Keith" <keith_siders@toshibatv.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: MTD files MIA, and strange permission failure 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Nov 2001 23:08:17 +0000
Message-ID: <31547.1005001697@redhat.com>
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

keith_siders@toshibatv.com said:
>  Can't find a linux/completion.h anywhere. Is this particular to a
> distribution? We appear to be using a MIPS port of RedHat 7.0. Console
> comes up showing:

Completions turned up in 2.4.8, I think. Should be compatibility cruft in 
include/linux/compatmac.h though.

Are you intentionally using JFFS instead of JFFS2? 

--
dwmw2
