Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRRDb-000368-Sl
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:32:17 +0000
Received: by mail-ie0-f179.google.com with SMTP id e14so2685111iej.24
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 11:31:54 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <CAN8TOE8PLvcK4kuRvbRh32gg0_Y8sbwWjdcWh_xt-tgQcPb85Q@mail.gmail.com>
References: <alpine.DEB.2.00.1309161003150.2394@lnxricardw.se.axis.com>
 <CAN8TOE8PLvcK4kuRvbRh32gg0_Y8sbwWjdcWh_xt-tgQcPb85Q@mail.gmail.com>
Date: Wed, 2 Oct 2013 11:31:53 -0700
Message-ID: <CAGXu5jK_BUqkVijBZ3-bhdYWZNf9dEfbJUWRsTuuoR8LWda0qg@mail.gmail.com>
Subject: Re: JFFS2 SUMMARY prior to Linux 3.9
From: Kees Cook <keescook@chromium.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 2, 2013 at 10:57 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Sep 16, 2013 at 1:04 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
>> I've noticed that JFFS2 summary has been relieved of it's EXPERIMENTAL
>> status since Linux 3.9 . But was it stable enough before then as well? -
>> often the EXPERIMENTAL property lingers on longer that it really needs to.
>
> AFAIK, JFFS2 hasn't changed much for many releases, so its current
> status pretty well reflects its status for many previous releases.
>
> Regarding the EXPERIMENTAL status; this was changed without CC'ing the
> MTD list (although David was CC'd, it seems) in commit:
>
> commit cf98c5e56807af7c793497bbd0446f71c383ffd5
> Author: Kees Cook <keescook@chromium.org>
> Date:   Wed Jan 16 18:54:12 2013 -0800
>
>     fs/jffs2: remove depends on CONFIG_EXPERIMENTAL
>
> Judging by the commit description, this change just represents a
> change in attitude toward the CONFIG_EXPERIMENTAL Kconfig option
> rather than any particular judgment of JFFS2 summary support.

Correct. CONFIG_EXPERIMENTAL was seen to have no meaning any more in
the face of things like distros always turning it on because they
wanted to enable some specific feature/device that was hiding behind
it.

Details about preferred handling of "unstable" features is documented here:
http://git.kernel.org/linus/5a958db311c416345a61b7bddc62a5c6c7112c7f

-Kees

-- 
Kees Cook
Chrome OS Security
