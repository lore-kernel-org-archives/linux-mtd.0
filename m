Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCj4Z-0001oX-7F
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 08:20:00 +0000
Received: by mail-pg0-x22b.google.com with SMTP id x23so105164891pgx.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2016 00:19:38 -0800 (PST)
Date: Fri, 2 Dec 2016 00:19:34 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de
Subject: Re: [PATCH 3/6] fscrypt: Cleanup fscrypt_{decrypt,encrypt}_page()
Message-ID: <20161202081934.GC18690@google.com>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
 <1480630498-19201-4-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480630498-19201-4-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 11:14:55PM +0100, Richard Weinberger wrote:
> + * @lblk_num:  Logical block number. This must be unique for multiple
> + *             calls with same page.

Must be unique for all calls with the same *inode*, except when overwriting
previously written data.

Eric
