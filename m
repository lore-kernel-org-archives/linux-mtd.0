Received: from wasp.conceptual.net.au ([203.190.192.17] helo=wasp.net.au)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjEJG-0002pA-Hm
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 05:38:19 -0400
Message-ID: <40EFB906.7060701@wasp.net.au>
Date: Sat, 10 Jul 2004 13:38:14 +0400
From: Brad Campbell <brad@wasp.net.au>
MIME-Version: 1.0
To: Patrick Hilt <philt@pioneer-pdt.com>
References: <200407091608.14442.philt@pioneer-pdt.com>
In-Reply-To: <200407091608.14442.philt@pioneer-pdt.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS 2 Question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patrick Hilt wrote:
> Hi list!
> Is there a way to make sure data is being written to physical flash when using 
> JFFS2? In other words, After writing a file on a JFFS2 partition, is there 
> anything that can be done to make sure that the data is getting written to 
> the flash right away? Would "sync" or "fsync" have that effect?

I believe that jffs2 is a synchronous filesystem in any case. By the time your application has 
returned from the write() call, the data is on flash.

It certainly worked that way while I was debugging some software that did stupid things like write 
800kb files 1 byte at a time.

Regards,
Brad
