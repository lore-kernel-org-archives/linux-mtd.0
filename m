Received: from mail-gx0-f223.google.com ([209.85.217.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRsuq-0000fw-7J
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 19:48:40 +0000
Received: by gxk23 with SMTP id 23so17025828gxk.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Jan 2010 11:48:34 -0800 (PST)
Message-ID: <4B424627.8090109@billgatliff.com>
Date: Mon, 04 Jan 2010 13:48:55 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can ID the NAND chip, but every erase block is bad?
References: <4B3ED430.5040607@billgatliff.com>
	<1262426622.3181.5832.camel@macbook.infradead.org>
In-Reply-To: <1262426622.3181.5832.camel@macbook.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> Take a closer look at how bad blocks were detected under 2.6.20.
>   

Found the problem.

I hacked the code to show me the bytes as they were being read from the
flash, and they were significantly different with my 2.6.32 kernel---
all zeros, in fact.  That led me to a bug in my cmd_ctrl code: I was
bailing out if the command was CMD_NONE, before writing anything to the
flash.  That causes some important bytes to get dropped, apparently.  :)


Thanks!


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
