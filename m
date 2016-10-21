Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxe06-0005YC-Jm
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 17:53:03 +0000
Received: by mail-pf0-x233.google.com with SMTP id e6so60425285pfk.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 10:52:06 -0700 (PDT)
Date: Fri, 21 Oct 2016 10:52:02 -0700
From: Michael Halcrow <mhalcrow@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 15/26] ubifs: Implement encrypt/decrypt for all IO
Message-ID: <20161021175202.GA20642@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-16-git-send-email-richard@nod.at>
 <20161021171439.GA17121@google.com>
 <78f09113-fcc3-c2d2-9849-ba980cd9c0b4@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f09113-fcc3-c2d2-9849-ba980cd9c0b4@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 07:21:04PM +0200, Richard Weinberger wrote:
> On 21.10.2016 19:14, Michael Halcrow wrote:
> > Compress-before-encrypt is a hazard.
> > 
> > http://www.iacr.org/cryptodb/archive/2002/FSE/3091/3091.pdf
> 
> I'm fully aware of that. But as usual it depends on the use case.
> Compression is optional in UBIFS, paranoid users can disable it
> when encryption is enabled.

It's not the paranoid users I'm concerned about.  It's those building
systems with complexity and nuance on top of UBIFS who aren't paranoid
enough.

I suggest disabling compression by default when encryption is enabled,
unless the user explicitly enables both.

> 
> Thanks,
> //richard
