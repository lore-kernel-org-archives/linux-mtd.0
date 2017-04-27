Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3nUk-0008Fg-2m
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 17:46:25 +0000
Received: by mail-pf0-x241.google.com with SMTP id a188so12413358pfa.2
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 10:46:01 -0700 (PDT)
Date: Thu, 27 Apr 2017 10:45:57 -0700
From: Eric Biggers <ebiggers3@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: fscrypt: update mailing list, patchwork,
 and git
Message-ID: <20170427174557.GB8130@gmail.com>
References: <20170426234300.54741-1-ebiggers3@gmail.com>
 <CAFLxGvzEr94f90QzQFucc3bCrv56fyVtd4ryQ062ot5FUovqFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvzEr94f90QzQFucc3bCrv56fyVtd4ryQ062ot5FUovqFQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 27, 2017 at 09:37:18AM +0200, Richard Weinberger wrote:
> > +FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION SUPPORT
> >  M:     Theodore Y. Ts'o <tytso@mit.edu>
> >  M:     Jaegeuk Kim <jaegeuk@kernel.org>
> 
> IMHO we should also add such an entry, to match reality:
> 
> R:      Eric Biggers <ebiggers@google.com>
> 

Well, we could, but IMO it's a little pointless since there's now a dedicated
mailing list, so there's no need to Cc me separately from the list.  I think
explicitly listing reviewer(s) is more useful for subsystems that don't have a
dedicated mailing list.

Eric
