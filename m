Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mcVZ-0001pM-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:55:57 +0100
Message-ID: <3D762DEC.C2517257@opersys.com>
Date: Wed, 04 Sep 2002 11:59:40 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Mark Meade <mark@lakeshoremicro.com>
CC: linux-mtd@lists.infradead.org, Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
References: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Mark,

Mark Meade wrote:
> I tested your Grub patch on a DoC Millennium, it works fine.

Great. I'm glad someone else can confirm that it works.

>  I used the 0.92
> patch, but I had to reduce the length of some of the text messages to make
> everything fit.  This may have been the gas 2.9.5 problem you described
> earlier.

True.

> This patch, while potentially useful during debugging, takes up precious
> space that may be needed later (to add support for new flash devices, etc).
> Also, once Grub is booting correctly from the DoC, I would think this feature
> would not be needed.
>
> For what it's worth, I'd recommend that this patch be made available in the
> patches directory of the CVS tree, rather than making it part of the official
> GRUB code.

This is one way of looking at it. However, it seems that this then enforces
a policy on the way developers use their hardware. Providing it as part of
the official GRUB and having it disabled by default would provide a capability
without enforcing a policy. A developer could then pass the
"--enable-doc-check-keybrd" option to "configure" in order to activate the
keyboard detection. This should be fairly easy to implement since all the
added code is enclosed in "#ifdef KEYBRD_READ" statements.

> I'm willing to revise my GRUB/DoC HOWTO to include instructions on the use of
> this patch, for those who are concerned about this issue.

A mention of any alternatives to the DOC hotplug would certainly be great.

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
