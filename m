Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dnbV-0007FI-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2002 08:57:37 +0100
Message-ID: <3D561999.593157B6@opersys.com>
Date: Sun, 11 Aug 2002 04:00:25 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Linux-MTD <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>,
   Ilguiz Latypov <ilatypov@superbt.com>, Mark Meade <mark@lakeshoremicro.com>
Subject: No more DoC hotplug on Grub fail [tested & working]
Content-Type: multipart/mixed;
 boundary="------------AF174B5C3603E81E664F4D9D"
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

This is a multi-part message in MIME format.
--------------AF174B5C3603E81E664F4D9D
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


I modified doc_stage1.S to check whether the user is holding
down the "ctrl" key while booting. If so, then it uses the
BIOS's original bootstrap handler instead of its own. This
avoids having to hotplug the DOC in case you misconfigure it
or if it fails to boot adequately for some other reason.

I had suggested this idea earlier on this list, but I figured
I'd dig up some of my old real-mode witchcraft and get it over
with. I sent a preliminary version of the code earlier, but
now that I tested it out, I know that that version doesn't
work. The version attached with the current e-mail, however,
does work.

The scheme works as described in my earlier emails.

Hopefully this saves some folks some cold sweat (me included).

Karim

P.S.: For some reason, gas 2.9.5 is unable to build my modified
doc_stage1.S in the prescribed 512 bytes. gas 2.12, nevertheless,
works just fine.

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
--------------AF174B5C3603E81E664F4D9D
Content-Type: application/octet-stream;
 name="doc_stage1.S.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="doc_stage1.S.bz2"

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


--------------AF174B5C3603E81E664F4D9D--
