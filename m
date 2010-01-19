Received: from ey-out-1920.google.com ([74.125.78.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXBPw-0006xD-9S
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 10:34:40 +0000
Received: by ey-out-1920.google.com with SMTP id 26so672293eyw.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jan 2010 02:34:34 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 19 Jan 2010 11:34:34 +0100
Message-ID: <804f0d21001190234t3d576efdi2b915b97df379f65@mail.gmail.com>
Subject: one time programmable flash (OTP)
From: Arno Steffen <arno.steffen@googlemail.com>
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

Is there any support by kernel to have access (write/read) to that OPT area?
The flash (MT29F1G) on my omap board has OTP blocks.
What do I have to do to get it and how to use?
I've been searching a lot in the net, but hasn't been succesful with
that, except for Blackfin's build-in OTP.
Best regards
Arno
