Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yz8z-0003cx-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2001 17:27:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110311213200.14757-200000@server.superbt.com> 
References: <Pine.LNX.4.33.0110311213200.14757-200000@server.superbt.com> 
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GNU GRUB 0.90 DiskOnChip patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Oct 2001 17:36:31 +0000
Message-ID: <3741.1004549791@redhat.com>
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

ilatypov@superbt.com said:
>  what is the reason for nftl_format to bail out when the erase unit
> size is not 8K?

Just because it's untested. 

--
dwmw2
