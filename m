Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17meu6-0002AU-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 19:29:26 +0100
Message-ID: <3D7651E7.B3633688@opersys.com>
Date: Wed, 04 Sep 2002 14:33:11 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Mark Meade <mark@lakeshoremicro.com>
CC: linux-mtd@lists.infradead.org, Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
References: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there> <3D762DEC.C2517257@opersys.com> <20020904180749.DAXN1399.rwcrmhc51.attbi.com@there>
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

Mark Meade wrote:
> Agreed.

Great, I'm glad there is a consensus on this.

>  It's just a matter of making everything fit into a very limited
> space.  As I mentioned earlier, maybe this feature is more valuable than the
> code that displays the manufacturer and chip ID codes.  Another option would
> be to make the SHOW_INFO and KEYBRD_READ conditionals mutually exclusive.

Isn't there a way to get the manufacturer and chip ID codes display outside
the first 512 bytes? Couldn't the code for this go in stage2 instead? We
could then have the best of both worlds.

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
