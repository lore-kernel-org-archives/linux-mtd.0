Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mdDO-0001wX-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 17:41:15 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: karim@opersys.com, Mark Meade <mark@lakeshoremicro.com>
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
Date: Wed, 4 Sep 2002 18:41:10 +0200
Cc: linux-mtd@lists.infradead.org
References: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there> <3D762DEC.C2517257@opersys.com>
In-Reply-To: <3D762DEC.C2517257@opersys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209041841.10466.hno@marasystems.com>
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

Karim Yaghmour wrote:

> Mark Meade wrote:
> > I tested your Grub patch on a DoC Millennium, it works fine.
>
> Great. I'm glad someone else can confirm that it works.

I can also confirm that the patch to selectively bypass grub works, at least 
on a DoC 2000 24MB. However due to other problems (discussed separately) I 
have not yet been able to use the GRUB firmware in production. Currently 
loading GRUB via the DOS firmware.

> This is one way of looking at it. However, it seems that this then enforces
> a policy on the way developers use their hardware. Providing it as part of
> the official GRUB and having it disabled by default would provide a
> capability without enforcing a policy. A developer could then pass the
> "--enable-doc-check-keybrd" option to "configure" in order to activate the
> keyboard detection. This should be fairly easy to implement since all the
> added code is enclosed in "#ifdef KEYBRD_READ" statements.

Agreed. It is a very valuable patch for anyone considering using GRUB DoC 
firmware, and certainly a must have for the first installs until one gets 
customized to the way GRUB works. Even with a boot loader as fancy as GRUB it 
is easy to fuck things up beyond repair...

Regards
Henrik
