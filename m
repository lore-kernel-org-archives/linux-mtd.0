Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5lnt-00027s-Te
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 04:22:19 +0000
Date: Tue, 2 May 2017 21:21:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Gwendal Grignou <gwendal@chromium.org>, hashimoto@chromium.org,
 kinaba@chromium.org, stable@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH 1/6] f2fs: check entire encrypted bigname when finding a
 dentry
Message-ID: <20170503042149.GA92555@jaegeuk.local>
References: <20170424170013.85175-1-ebiggers3@gmail.com>
 <20170424170013.85175-2-ebiggers3@gmail.com>
 <20170425001023.GA4983@jaegeuk.local> <20170503025628.GA624@zzz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170503025628.GA624@zzz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eric,

On 05/02, Eric Biggers wrote:
> Hi Jaegeuk,
> 
> On Mon, Apr 24, 2017 at 05:10:23PM -0700, Jaegeuk Kim wrote:
> > Hi Eric,
> > 
> > This looks good to me.
> > I'll drop it from my tree, so please move forward through fscrypt.
> > 
> > Thanks,
> 
> This is in fscrypt/master now (along with the other patches in the series), but
> it's also in f2fs/dev.  Are you still planning to drop it from the f2fs tree?

Oh, yup. I dropped it.
Thank you for pointing this out.

Thanks,

> 
> - Eric
