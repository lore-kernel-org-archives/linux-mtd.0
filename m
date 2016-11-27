Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAtHo-0001ts-Io
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 06:50:05 +0000
Received: by mail-pg0-x235.google.com with SMTP id p66so44589211pga.2
 for <linux-mtd@lists.infradead.org>; Sat, 26 Nov 2016 22:49:42 -0800 (PST)
Date: Sat, 26 Nov 2016 22:49:38 -0800
From: Eric Biggers <ebiggers@google.com>
To: David Gstir <david@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 01/29] fscrypt: Add in-place encryption mode
Message-ID: <20161127064938.GC34163@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-2-git-send-email-richard@nod.at>
 <20161115181455.GA127180@google.com>
 <C622816B-E69F-4B81-9F37-E04E06CDC591@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C622816B-E69F-4B81-9F37-E04E06CDC591@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 25, 2016 at 01:09:05PM +0100, David Gstir wrote:
> 
> > Additionally, after this change the name of the flag FS_WRITE_PATH_FL is
> > misleading, since it now really indicates the presence of a bounce buffer rather
> > than the "write path".
> 
> I can see no use case for FS_WRITE_PATH_FL other than to indicate that the bounce buffer has to be free'd. Is there any reason why we should not just remove it and check the presence of a bounce buffer by a simple "if (ctx->w.bounce_page)" ?
> 

It appears that the flag is needed because the 'w' (write) and 'r' (read)
members are in union.  So you can't simply check for 'ctx->w.bounce_page'.

Eric
