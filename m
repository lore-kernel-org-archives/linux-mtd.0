Received: from mail-ve0-x22f.google.com ([2607:f8b0:400c:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRQfx-0001f8-6w
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 17:57:30 +0000
Received: by mail-ve0-f175.google.com with SMTP id jy13so860650veb.34
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 10:57:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1309161003150.2394@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1309161003150.2394@lnxricardw.se.axis.com>
Date: Wed, 2 Oct 2013 10:57:04 -0700
Message-ID: <CAN8TOE8PLvcK4kuRvbRh32gg0_Y8sbwWjdcWh_xt-tgQcPb85Q@mail.gmail.com>
Subject: Re: JFFS2 SUMMARY prior to Linux 3.9
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux mtd <linux-mtd@lists.infradead.org>, Kees Cook <keescook@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 16, 2013 at 1:04 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> I've noticed that JFFS2 summary has been relieved of it's EXPERIMENTAL
> status since Linux 3.9 . But was it stable enough before then as well? -
> often the EXPERIMENTAL property lingers on longer that it really needs to.

AFAIK, JFFS2 hasn't changed much for many releases, so its current
status pretty well reflects its status for many previous releases.

Regarding the EXPERIMENTAL status; this was changed without CC'ing the
MTD list (although David was CC'd, it seems) in commit:

commit cf98c5e56807af7c793497bbd0446f71c383ffd5
Author: Kees Cook <keescook@chromium.org>
Date:   Wed Jan 16 18:54:12 2013 -0800

    fs/jffs2: remove depends on CONFIG_EXPERIMENTAL

Judging by the commit description, this change just represents a
change in attitude toward the CONFIG_EXPERIMENTAL Kconfig option
rather than any particular judgment of JFFS2 summary support.

Brian
