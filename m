Received: from rwcrmhc51.attbi.com ([204.127.198.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbdm-0001ZQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:00:22 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
Date: Wed, 4 Sep 2002 10:58:38 -0400
Cc: Karim Yaghmour <karim@opersys.com>,
 Ilguiz Latypov <ilatypov@superbt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there>
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

Karim,

I tested your Grub patch on a DoC Millennium, it works fine.  I used the 0.92 
patch, but I had to reduce the length of some of the text messages to make 
everything fit.  This may have been the gas 2.9.5 problem you described 
earlier.

This patch, while potentially useful during debugging, takes up precious 
space that may be needed later (to add support for new flash devices, etc).  
Also, once Grub is booting correctly from the DoC, I would think this feature 
would not be needed.

For what it's worth, I'd recommend that this patch be made available in the 
patches directory of the CVS tree, rather than making it part of the official 
GRUB code.

I'm willing to revise my GRUB/DoC HOWTO to include instructions on the use of 
this patch, for those who are concerned about this issue.

Mark

Karim Yaghmour wrote:
> I modified doc_stage1.S to check whether the user is holding
> down the "ctrl" key while booting. If so, then it uses the
> BIOS's original bootstrap handler instead of its own. This
> avoids having to hotplug the DOC in case you misconfigure it
> or if it fails to boot adequately for some other reason.

> I had suggested this idea earlier on this list, but I figured
> I'd dig up some of my old real-mode witchcraft and get it over
> with. I sent a preliminary version of the code earlier, but
> now that I tested it out, I know that that version doesn't
> work. The version attached with the current e-mail, however,
> does work.

> The scheme works as described in my earlier emails.

> Hopefully this saves some folks some cold sweat (me included).

> Karim

> P.S.: For some reason, gas 2.9.5 is unable to build my modified
> doc_stage1.S in the prescribed 512 bytes. gas 2.12, nevertheless,
> works just fine.
