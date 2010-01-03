Subject: Re: Can ID the NAND chip, but every erase block is bad?
From: David Woodhouse <dwmw2@infradead.org>
To: Bill Gatliff <bgat@billgatliff.com>
In-Reply-To: <4B40A27A.30804@billgatliff.com>
References: <4B3ED430.5040607@billgatliff.com>
	<1262426622.3181.5832.camel@macbook.infradead.org>
	<4B40A27A.30804@billgatliff.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 03 Jan 2010 15:55:15 +0000
Message-ID: <1262534115.3181.5851.camel@macbook.infradead.org>
Mime-Version: 1.0
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

On Sun, 2010-01-03 at 07:58 -0600, Bill Gatliff wrote:
> 
> 
> Ok, I'll take a look into that code.
> 
> Is there any way to instruct MTD to discard any previous bad block
> information, and reconstruct the bad block table from scratch?

In general, it's not possible to reconstruct the bad block table from
scratch. Don't lose the previous bad block table. That's why we
generally write two copies of it...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
