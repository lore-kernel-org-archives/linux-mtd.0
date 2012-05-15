Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUK8U-0006Wr-PZ
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 15:58:07 +0000
Received: by bkwj4 with SMTP id j4so6455716bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 08:58:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 15 May 2012 11:57:43 -0400
Message-ID: <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
To: uClinux development list <uclinux-dev@uclinux.org>
Content-Type: text/plain; charset=UTF-8
Cc: Greg Ungerer <gerg@uclinux.org>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2012 at 12:08 AM,  <gerg@snapgear.com> wrote:
> . make the struct uclinux_ram_map static

NAK: this breaks Blackfin systems.  we specifically don't want this to
be static.

it should probably get a comment added above it saying as much.
-mike
