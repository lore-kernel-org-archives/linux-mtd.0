Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f9zE-0005iA-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 01:59:13 +0100
Message-ID: <3B981BF6.24FD764D@sis.com.tw>
Date: Fri, 07 Sep 2001 08:59:34 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: kira brown <kira@hex.linuxgrrls.org>,
        Herman Oosthuysen <herman@wirelessnetworksinc.com>,
        "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance
References: <Pine.LNX.4.33.0109061649230.9437-100000@hex.linuxgrrls.org> <14482.999791732@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> kira@hex.linuxgrrls.org said:
> >  There are basically two ways to speed this situation up:
> 
> Don't forget "don't use O(n^3) algorithms when trying to find a new block
> to write to".
> 

What does this suppose to mean ??

Ollie
