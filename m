Received: from avasout05.plus.net ([84.93.230.250])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEKDH-0001x4-9y
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 18:11:38 +0000
Received: from mac by deneb with local (Exim 4.84_2)
 (envelope-from <mac@mcrowe.com>) id 1cEKCq-0005MK-TG
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 18:11:08 +0000
Date: Tue, 6 Dec 2016 18:11:08 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Support skipping a certain number of good blocks
Message-ID: <20161206181108.GA20416@mcrowe.com>
References: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 06 December 2016 at 18:04:15 +0000, Mike Crowe wrote:
> I found myself needing to write part of a partition that will be read
> by the bootloader by skipping blocks from the start of the partition.
> These new command-line options let me write and verify.

I now realise that I forgot to add Signed-off-by headers to these patches.
If they are found to be acceptable without further change then I will
resend them with the headers.

Mike.
