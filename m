Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qpDw-0007fM-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 06:14:37 +0100
To: <linux-mtd@lists.infradead.org>
Subject: Q: Probing for devices > buswidth???
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 08 Oct 2001 23:23:44 -0600
Message-ID: <m3y9mljsin.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I'm trying to bringin some mtd map drivers for some non cfi devices.

Trying to understand some anomolous results I discovered that
gen_probe_newchip is looking for:
16 bit devices on an 8 bit bus.
byte interleaved 16 bit devices on a 16 bit bus.
And some really bizare things for a 32 bit bus.

Is there any good reason for doing it that way?

If not I'm going to figure out how to kill that extra confusing code.

Eric
