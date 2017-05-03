Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5kTE-0002bQ-Fz
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 02:56:54 +0000
Received: by mail-pg0-x242.google.com with SMTP id i63so6353764pgd.2
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 19:56:31 -0700 (PDT)
Date: Tue, 2 May 2017 19:56:28 -0700
From: Eric Biggers <ebiggers3@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Gwendal Grignou <gwendal@chromium.org>, hashimoto@chromium.org,
 kinaba@chromium.org, stable@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH 1/6] f2fs: check entire encrypted bigname when finding a
 dentry
Message-ID: <20170503025628.GA624@zzz>
References: <20170424170013.85175-1-ebiggers3@gmail.com>
 <20170424170013.85175-2-ebiggers3@gmail.com>
 <20170425001023.GA4983@jaegeuk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170425001023.GA4983@jaegeuk.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jaegeuk,

On Mon, Apr 24, 2017 at 05:10:23PM -0700, Jaegeuk Kim wrote:
> Hi Eric,
> 
> This looks good to me.
> I'll drop it from my tree, so please move forward through fscrypt.
> 
> Thanks,

This is in fscrypt/master now (along with the other patches in the series), but
it's also in f2fs/dev.  Are you still planning to drop it from the f2fs tree?

- Eric
