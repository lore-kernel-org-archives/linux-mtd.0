Subject: Re: Handling badblock in MTD
From: David Woodhouse <dwmw2@infradead.org>
To: ryadav@neomagic.com
In-Reply-To: <SMTP012FlmmlQ080Gxw00004743@Mx1.myOutLookonline.com>
References: <SMTP012FlmmlQ080Gxw00004743@Mx1.myOutLookonline.com>
Content-Type: text/plain
Date: Thu, 16 Aug 2007 19:38:45 +0800
Message-Id: <1187264325.2778.302.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-08-16 at 15:10 +0530, Raj Kumar Yadav wrote:
> 
> It seems, the block is bad to an extent that the erase also have no effect.
> This means that, I cannot mark the block bad, as the first page is all 0xff
> and write on the page has no effect on page data.
> 
> So, ending up to a situation, where the block will never be marked bad, and
> the write will always fail (due to MTD NAND verify) on the block pages.
> 
> Currently, we are using the first byte of the first page in the Block to
> detect/mark the block as bad.
> 
> What is the standard solution for this, Should the second page also be used
> for detecting the bad block in MTD nand layer. But then how far we can go
> about adding the pages to detect/mark bad block. 
> 
> Is there any better method/policy to deal with it? 

Use a bad block table.

-- 
dwmw2
