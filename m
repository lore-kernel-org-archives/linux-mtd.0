Received: from mail-ve0-x22e.google.com ([2607:f8b0:400c:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wu2p3-0007Ws-Vs
 for linux-mtd@lists.infradead.org; Mon, 09 Jun 2014 16:53:26 +0000
Received: by mail-ve0-f174.google.com with SMTP id us18so4665978veb.19
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2014 09:53:03 -0700 (PDT)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <1402307589.20454.49.camel@sauron.fi.intel.com>
References: <1402307589.20454.49.camel@sauron.fi.intel.com>
Date: Mon, 9 Jun 2014 09:53:02 -0700
Message-ID: <CA+55aFwr9Gtgn1JssNJFUDTsvgxoDe9BAM4XLiv5g3wDqxfS_Q@mail.gmail.com>
Subject: Re: [GIT PULL] UBIFS changes for 3.16
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mind re-sending the explanations in their full form?

They seem to have gotten cut off, probably because some bad
cut-and-paste that missed a line or two. And the cut-and-paste error
happened when you wrote the tag signature, so the missing parts aren't
in the signed tag either, it has the same problem.

See how the description starts in the middle with "condition between
..", and then goes on to talk about "The other", when it hasn't really
said "the first" or whatever the missing part was supposed to say..

             Linus

On Mon, Jun 9, 2014 at 2:53 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> ----------------------------------------------------------------
> condition between the mmap page fault path and fsync. The other
> just removes a bogus assertion from the UBIFS memory shrinker.
>
> UBIFS also started honoring the MS_SILENT mount flag, so now it won't print
> many I/O errors when user-space just tries to probe for the FS.
>
> Rest of the changes are rather minor UBI/UBIFS fixes, improvements, and
> clean-ups.
