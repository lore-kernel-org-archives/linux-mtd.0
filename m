Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Olscu-0005PR-Tq
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 00:05:01 +0000
Message-ID: <4C6C7513.2080603@broadcom.com>
Date: Wed, 18 Aug 2010 17:04:35 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Abdoulaye Walsimou GAYE" <awg@embtoolkit.org>
Subject: Re: [PATCH] mtd: nand: Fix regression in BBM detection
References: <1282155904-10113-1-git-send-email-norris@broadcom.com>
	<4C6C34DE.2050904@embtoolkit.org>
In-Reply-To: <4C6C34DE.2050904@embtoolkit.org>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"mike@it-loops.com" <mike@it-loops.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18/2010 12:30 PM, Abdoulaye Walsimou GAYE wrote:
> Brian,
> Sorry for the long delay!
> I tested the above patch unfortunately it does not help in my case!

Understood. That makes sense. In fact, your problem is most likely *not* 
related to this commit. As I mentioned before, please try narrowing down 
what specifically caused this; if I read correctly, you jumped from 
2.6.33 to 2.6.36-rc1. There have been several important changes between 
those releases. Notably, this commit may be giving Samsung chips problems:
426c457a3216fac74e

This thread is covering a few problems with Samsung:
http://lists.infradead.org/pipermail/linux-mtd/2010-August/031590.html

> And when I go further and put a JFFS2 in that partition and boot the
> board I have
<snip>
> Despite these errors I can actually use the board (no kernel panic)!
> The part is Samsung K9F1208U0C - PCB0

Unless you really know what you're doing, I wouldn't be writing/erasing 
the flash if it's not detecting bad blocks properly.

Let me know if you have trouble with narrowing down to the problem commit.

Brian
