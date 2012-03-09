Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S679m-0004G8-6h
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 21:15:23 +0000
Received: by bkcjk13 with SMTP id jk13so2030447bkc.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2012 13:15:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1331315349-8541-1-git-send-email-computersforpeace@gmail.com>
References: <1331315349-8541-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 9 Mar 2012 16:14:59 -0500
Message-ID: <CAMjpGUf_z4Mk=8wr23TGXy2csUNESzBKx+VMrpGTimDZ23oA7Q@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: fix "make clean" for old GNU find
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 9, 2012 at 12:49, Brian Norris <computersforpeace@gmail.com> wrote:
> findutils v4.1.x does not have the `-exec CMD {} +' syntax. We can just as
> easily use the `-exec CMD {} \;' syntax. However, it will launch a lot more
> `rm' processes, so we only use it if the first form fails with an error.
> This isn't a perfect solution (`find -exec +' can fail for other reasons)
> but it works well enough.
>
> This problem manifests itself in RHEL 4, findutils 4.1.20:

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
