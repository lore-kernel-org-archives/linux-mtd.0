Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cxwV-0007Gn-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 01:47:51 +0100
Message-ID: <3D5311E7.93A4805B@opersys.com>
Date: Thu, 08 Aug 2002 20:50:47 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Avoiding DOC hotplug when Grub fails
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

As far as I can see by browsing this mailing list archive, one
has to hotplug the DOC device in order to have the HD come up
first if Grub fails in some way after having hijacked int 19h.
This is rather inconvenient, to say the least.

Why not just hijack int 16h (keyboard) while we're at it, write
a small keyboard int handler, and check if the space-bar (or
some other key) is held down while Grub is booting? If it is,
then Grub invokes the BIOS's original int 19h which then proceeds
normally. If it isn't, then Grub continues with its own load
procedure.

Comments?

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
