Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157xeP-0007QK-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 12:08:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010607130309.A28720@crystal.2d3d.co.za> 
References: <20010607130309.A28720@crystal.2d3d.co.za> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: erase questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Jun 2001 12:12:41 +0100
Message-ID: <13861.991912361@redhat.com>
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

abraham@2d3d.co.za said:
>  If ->len may span multiple blocks, must it be equal to the size of
> all the blocks (e.g. if you we're to erase a 2x 4k + 3x 8k consecutive
> blocks, must len be equal to 32k)?

The only constraints are that both <start> and <start+len> must be aligned 
with erase block boundaries.

If you have a chip with 8*8K erase blocks followed by 15*64K erase blocks, 
then an erase of length 72K at offset 56K is permitted - you'd erase the 
last of the small blocks and the first of the big blocks.

--
dwmw2
