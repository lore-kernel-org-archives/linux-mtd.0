Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fA1n-0005im-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 02:01:51 +0100
Message-ID: <3B981CA3.A81D9285@sis.com.tw>
Date: Fri, 07 Sep 2001 09:02:27 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Holger Friedrich <friedrich@MAZeT.de>,
        "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance
References: <3B978FD5.D35F06BF@mazet.de> <9184.999788572@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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
> 
> Our driver is fairly naïve, and may well be wasting a lot of time which
> it shouldn't. I can give you pointers on fixing that, if you're
> interested.
> 

David,
	Did you "threaded" NFTL code yet ?? Or we still get locked
when NFTL is syncing/flushing ??

Ollie
