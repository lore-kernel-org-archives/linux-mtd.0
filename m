Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uGCA-0002Yo-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 17:06:44 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uGBb-0000BT-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 17:06:07 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uGBa-0000BM-00
	for mtd@infradead.org; Mon, 30 Apr 2001 17:06:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00ac01c0d18c$dd6abb40$fd01a8c0@jun0001> 
References: <00ac01c0d18c$dd6abb40$fd01a8c0@jun0001> 
To: "modream" <xitron@modream.co.kr>
Cc: mtd@infradead.org
Subject: Re: help me --- end_request: I/O error, dev 1f:02 (mtdblock), sector 32768 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Apr 2001 17:05:53 +0100
Message-ID: <3155.988646753@redhat.com>
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

xitron@modream.co.kr said:
>   { "mtd2", 0x1f02 },               -------------------> add

mtd2 should be a character device. Major 90, minor 4. Don't do that.

I think you meant mtdblock2 (block major 31, minor 2). Which is covered by 
the 'mtdblock' line just above. 


xitron@modream.co.kr said:
> mtdblock: erase of region [0x840000, 0x40000] on "<NULL>" failed
> end_request: I/O error, dev 1f:02 (mtdblock), sector 32776

Does it work if you try to 'eraseall /dev/mtd2' - once you've actually made 
the correct device node, of course.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
