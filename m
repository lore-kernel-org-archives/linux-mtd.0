Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fIMQ-0006Ut-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 10:55:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B989822.DC1D51BE@sis.com.tw> 
References: <3B989822.DC1D51BE@sis.com.tw>  <3B981BF6.24FD764D@sis.com.tw> <Pine.LNX.4.33.0109061649230.9437-100000@hex.linuxgrrls.org> <14482.999791732@redhat.com> <17891.999850127@redhat.com> 
To: Ollie Lho <ollie@sis.com.tw>
Cc: kira brown <kira@hex.linuxgrrls.org>,
    Herman Oosthuysen <herman@wirelessnetworksinc.com>,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 07 Sep 2001 11:01:39 +0100
Message-ID: <4786.999856899@redhat.com>
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

ollie@sis.com.tw said:
>  Yea, I know what Big O is although I am not CompSci graduate. 

Sorry :)

> My question is which part of the NFTL code is that bad ??

The bit that selects a chain to fold in NFTL_makefreeblock is fairly crap, 
and the way we do findfreeblock(0)/makefreeblock()/findfreeblock(desperate)
in NFTL_findwriteunit() is also fairly crap.

That lot wants rethinking.



--
dwmw2
