Received: from rwcrmhc51.attbi.com ([204.127.198.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17meZg-00028y-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 19:08:20 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: karim@opersys.com
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
Date: Wed, 4 Sep 2002 14:07:19 -0400
Cc: linux-mtd@lists.infradead.org,
 Ilguiz Latypov <ilatypov@superbt.com>
References: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there> <3D762DEC.C2517257@opersys.com>
In-Reply-To: <3D762DEC.C2517257@opersys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020904180749.DAXN1399.rwcrmhc51.attbi.com@there>
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
> This is one way of looking at it. However, it seems that this then enforces
> a policy on the way developers use their hardware. Providing it as part of
> the official GRUB and having it disabled by default would provide a
> capability without enforcing a policy. A developer could then pass the
> "--enable-doc-check-keybrd" option to "configure" in order to activate the
> keyboard detection. This should be fairly easy to implement since all the
> added code is enclosed in "#ifdef KEYBRD_READ" statements.

Agreed.  It's just a matter of making everything fit into a very limited 
space.  As I mentioned earlier, maybe this feature is more valuable than the 
code that displays the manufacturer and chip ID codes.  Another option would 
be to make the SHOW_INFO and KEYBRD_READ conditionals mutually exclusive.

Mark
