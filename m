Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cVYRn-0007ty-O9
 for linux-mtd@lists.infradead.org; Mon, 23 Jan 2017 06:49:50 +0000
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
To: Mike Crowe <mac@mcrowe.com>, linux-mtd@lists.infradead.org
References: <1484654044-17722-1-git-send-email-mac@mcrowe.com>
Cc: richard@nod.at
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <1d5e298d-e8e4-4e09-b315-2f7af7361fbc@sigma-star.at>
Date: Mon, 23 Jan 2017 07:47:50 +0100
MIME-Version: 1.0
In-Reply-To: <1484654044-17722-1-git-send-email-mac@mcrowe.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2017 12:54 PM, Mike Crowe wrote:
> I found myself needing to write and verify part of a partition that
> will be read by the bootloader by skipping blocks from the start of
> the partition. Initially I added separate --input-skip and
> --output-skip options but David Oberhollenzer suggested in
> <cdfdbe5d-1aa8-e424-7691-338d0d63f7b1 at sigma-star.at>
> http://lists.infradead.org/pipermail/linux-mtd/2016-December/070855.html
> that a simple flag to indicate that the start address should skip bad
> blocks would avoid ambiguity.
> 
> David also suggested that I skip the bad blocks in a separate step
> before the already-cluttered main loop.
> 
> This version uses is_virt_block_bad in nandwrite, so the series now depends
> on David Oberhollenzer's virtual block handling fixes from
> <20170112102828.13124-1-david.oberhollenzer@sigma-star.at>
> http://lists.infradead.org/pipermail/linux-mtd/2017-January/071544.html
> 
> Mike Crowe (2):
>   nandwrite: Add --skip-bad-blocks-to-start option
>   nanddump: Add --skip-bad-blocks-to-start option
> 
>  nand-utils/nanddump.c  | 23 +++++++++++++++++++++++
>  nand-utils/nandwrite.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
Applied to mtd-utils.git.


Thanks,

David
