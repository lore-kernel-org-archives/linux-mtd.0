Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SD64J-0000X5-Mp
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 03:30:36 +0000
Received: by bkcjk13 with SMTP id jk13so2011873bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2012 20:30:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1332979146-8866-1-git-send-email-computersforpeace@gmail.com>
References: <1332979146-8866-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 28 Mar 2012 23:30:12 -0400
Message-ID: <CAMjpGUdofgnNfJvTZubwhmuMZs0P34kdtvzTV2Vj+iN-EsFaeQ@mail.gmail.com>
Subject: Re: [PATCH (mtd-utils)] Makefile: fixup previous 'make clean' fix
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

On Wed, Mar 28, 2012 at 19:59, Brian Norris <computersforpeace@gmail.com> wrote:
> Apparently, Makefile comments need to be made without indentation. Otherwise,
> they are printed out as shell commands. This fix prevents seeing this in your
> shell during 'make clean':

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
