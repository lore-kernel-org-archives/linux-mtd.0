Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHZ0N-0000wW-7F
 for linux-mtd@lists.infradead.org; Wed, 22 Nov 2017 17:40:12 +0000
Received: by mail-it0-x234.google.com with SMTP id n134so7187816itg.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2017 09:39:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwfchgz59E_bA5VEY7cQ-Pig-AaAyBfw=m9msMgP0nt9Q@mail.gmail.com>
References: <CAJz5OpfXTXzvVZxmCC1+R1AU6qqHaGoH-KJKWd_Fixt2EgAJSw@mail.gmail.com>
 <CAFLxGvwfchgz59E_bA5VEY7cQ-Pig-AaAyBfw=m9msMgP0nt9Q@mail.gmail.com>
From: Frank Mori Hess <fmh6jj@gmail.com>
Date: Wed, 22 Nov 2017 12:39:49 -0500
Message-ID: <CAJz5OpcPp0QhzTdzg_mwFki0++M3v1F_ivZct+hsnW=crgWPQA@mail.gmail.com>
Subject: Re: Jffs2: systemd-journald fails to open log files on jffs2
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 22, 2017 at 12:07 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> But I'd like to know why you are still using JFFS2.
> Is this some super small NOR flash where UBIFS does not work?

No it is just historical.  The decision to use jffs2 was probably made
before ubifs existed.

-- 
Frank
