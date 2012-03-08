Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5gbh-00010K-HY
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 16:54:26 +0000
Received: by bkcjk13 with SMTP id jk13so699484bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Mar 2012 08:54:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1330726673-9860-1-git-send-email-computersforpeace@gmail.com>
References: <1330726673-9860-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 8 Mar 2012 11:54:02 -0500
Message-ID: <CAMjpGUc1m8D-nKVoddTehEDfx0r9R+sMTgtqxkfEG9W2Ok6-6w@mail.gmail.com>
Subject: Re: [PATCH (mtd-utils)] Makefile: fix "make clean" for old GNU find
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

On Fri, Mar 2, 2012 at 17:17, Brian Norris <computersforpeace@gmail.com> wrote:
> findutils v4.1.x does not have the `-exec CMD {} +' syntax. We can just as
> easily use the `-exec CMD {} \;' syntax.

really it's a workaround for old tools that don't adhere to the new POSIX spec

> However, it will launch a lot more `rm' processes...

indeed, that does suck.  you could do this, but it kind of sucks too ...
CLEAN_FIND = find "$(BUILDDIR)/" -xdev '(' -name '*.[ao]' -o -name
'.*.c.dep' ')'
...
    @if test -d "$(BUILDDIR)/"; then
        $(CLEAN_FIND) -exec rm -f {} + 2>/dev/null || \
        $(CLEAN_FIND) -exec rm -f {} \; ; \
    fi
...
-mike
