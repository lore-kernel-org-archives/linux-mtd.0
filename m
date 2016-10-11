Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bu1JM-000480-Mw
 for linux-mtd@lists.infradead.org; Tue, 11 Oct 2016 17:58:03 +0000
Received: by mail-oi0-x242.google.com with SMTP id d132so1925550oib.2
 for <linux-mtd@lists.infradead.org>; Tue, 11 Oct 2016 10:57:36 -0700 (PDT)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <3aa0f87a-ae67-5701-3fa7-4e91f0ea24ea@nod.at>
References: <3aa0f87a-ae67-5701-3fa7-4e91f0ea24ea@nod.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Oct 2016 10:57:34 -0700
Message-ID: <CA+55aFx72t6kqrZ0m-tbXzR4UHaq2zti3ZcTeo9PJQzRGa8Syg@mail.gmail.com>
Subject: Re: [GIT PULL] UBI/UBIFS updates for 4.9-rc1
To: Richard Weinberger <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 11, 2016 at 8:33 AM, Richard Weinberger <richard@nod.at> wrote:
>
> This pull request contains:
> * Fixes for both UBI and UBIFS
> * overlayfs support (O_TMPFILE, RENAME_WHITEOUT/EXCHANGE)
> * Code refactoring for the upcoming MLC support

In the meantime, on a VFS level, we got rid of the "rename2" naming,
and now the plain regular rename is the extended version.

There's a few other filesystems using "rename2" as a name for the now
no longer true historical reasons, but I noticed it particularly in
this pull request because I fixed up a trivial conflict around that
area.

You might consider renaming it, or just put the "rename2" logic into
the regular rename function, but whatever. It doesn't really _matter_,
it's just an odd naming artifact.

(I've not pushed out my merge yet, it's still going through the build
tests etc, but I thought I'd mention this detail).

               Linus
