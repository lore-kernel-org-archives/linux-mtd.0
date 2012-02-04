Received: from longford.logfs.org ([213.229.74.203])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtlTg-0007qz-B6
 for linux-mtd@lists.infradead.org; Sat, 04 Feb 2012 19:40:53 +0000
Date: Sat, 4 Feb 2012 13:00:35 -0500
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/8] mtd: block2mtd: initialize writebufsize
Message-ID: <20120204180035.GB28736@logfs.org>
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 February 2012 10:43:07 +0200, Artem Bityutskiy wrote:
> 
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> The writebufsize concept was introduce by commit
> "0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
> the maximum amount of data the device writes to the media at a time. This is
> an important parameter for UBIFS which is used during recovery and which
> basically defines how big a corruption caused by a power cut can be.
> 
> However, we forgot to set this parameter for block2mtd. Set it to PAGE_SIZE
> because this is actually the amount of data we write at a time.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: stable@kernel.org [2.6.38+]
> Cc: Joern Engel <joern@lazybastard.org>

Acked-by: Joern Engel <joern@lazybastard.org>

>From the description of 0e4ca7e it appears as if using a minimum of
say 8 for ubifs recovery would have done the trick as well.  Oh well!

Jörn
