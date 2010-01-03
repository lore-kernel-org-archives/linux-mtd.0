Received: from mail-gx0-f223.google.com ([209.85.217.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRQy0-0006qP-Fl
	for linux-mtd@lists.infradead.org; Sun, 03 Jan 2010 13:58:04 +0000
Received: by gxk23 with SMTP id 23so16010434gxk.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Jan 2010 05:57:59 -0800 (PST)
Message-ID: <4B40A27A.30804@billgatliff.com>
Date: Sun, 03 Jan 2010 07:58:18 -0600
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
> A virgin chip will use a certain byte in the spare area of each
> eraseblock to mark that block as bad. But often we reclaim those bytes
> and transcribe the information into a bad block table elsewhere on the
> flash.
>
> Booting a kernel which ignores the bad block table and looks for the bad
> block markers in the original location will have fairly much the effect
> you describe.
>   

Ok, I'll take a look into that code.

Is there any way to instruct MTD to discard any previous bad block
information, and reconstruct the bad block table from scratch?


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
