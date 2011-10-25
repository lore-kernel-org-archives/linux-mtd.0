Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIqCI-0006GM-C0
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 23:14:19 +0000
Received: by faaf16 with SMTP id f16so1389075faa.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 16:14:16 -0700 (PDT)
MIME-Version: 1.0
From: Robert Orzanna <orschiro@googlemail.com>
Date: Wed, 26 Oct 2011 12:13:36 +1300
Message-ID: <CAEq8YR8Vq1mDxOovREb5CBH-PfoWAP4_p-54W4icZ8bvip90Eg@mail.gmail.com>
Subject: Access to a xd memory card
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I wonder if mtd is the right approach to mount my xd memory card.
Before I installed mtd-utils I had two corresponding files in /dev
called mtd0 and mtd0ro. However, I was not able to mount them as they
are no block devices. Now after installing mtd-utils those two files
do not always exist anymore and I do not have any idea how to process
further.

I should mention that I use an Archlinux 64 bit with kernel 3.0.6-2
and mtd-utils 1.4.6.

Output of lspci -v.

0d:00.3 System peripheral: Ricoh Co Ltd xD-Picture Card Controller (rev 12)
Subsystem: Lenovo Device 210d
Flags: bus master, medium devsel, latency 64, IRQ 17
Memory at febfe800 (32-bit, non-prefetchable) [size=256]
Capabilities: <access denied>
Kernel driver in use: r852
Kernel modules: r852

If you need more information, just let me know and I will provide them.

Thank you for your advice.

Regards,

Robert
