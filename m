Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUOCw-0002JZ-7N
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 21:23:30 +0000
Received: by mail-ie0-f170.google.com with SMTP id at1so4168744iec.29
 for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2013 14:23:27 -0700 (PDT)
Date: Mon, 22 Apr 2013 14:23:24 -0700
From: Kent Overstreet <koverstreet@google.com>
To: Namjae Jeon <linkinjeon@gmail.com>
Subject: Re: [PATCH v2 0/9] fix max discard sectors limit
Message-ID: <20130422212324.GB4704@localhost>
References: <1366389602-19313-1-git-send-email-linkinjeon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366389602-19313-1-git-send-email-linkinjeon@gmail.com>
Cc: axboe@kernel.dk, nbd-general@lists.sourceforge.net,
 linux-raid@vger.kernel.org, npiggin@kernel.dk, linux-scsi@vger.kernel.org,
 neilb@suse.de, dwmw2@infradead.org, Namjae Jeon <namjae.jeon@samsung.com>,
 Paul.Clements@steeleye.com, adrian.hunter@intel.com, JBottomley@parallels.com,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 jcmvbkbc@gmail.com, linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 cjb@laptop.org, shli@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 20, 2013 at 01:40:02AM +0900, Namjae Jeon wrote:
> From: Namjae Jeon <namjae.jeon@samsung.com>
> 
> linux-v3.8-rc1 and later support for plug for blkdev_issue_discard with
> commit 0cfbcafcae8b7364b5fa96c2b26ccde7a3a296a9 
> (block: add plug for blkdev_issue_discard )
> 
> For example,
> 1) DISCARD rq-1 with size size 4GB
> 2) DISCARD rq-2 with size size 1GB
> 
> If these 2 discard requests get merged, final request size will be 5GB.
> 
> In this case, request's __data_len field may overflow as it can store
> max 4GB(unsigned int).

Complete NACK - like James said, this fix is nonsensical. This should be
fixed by just checking for overflow before merging requests, not with
weird hacks in the drivers.
