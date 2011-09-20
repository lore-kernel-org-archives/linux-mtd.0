Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5yPH-0002cm-4F
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 11:22:31 +0000
Received: by yxi11 with SMTP id 11so253721yxi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 04:22:28 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 Sep 2011 13:22:28 +0200
Message-ID: <CAFDOyVAzYULUuJMCTAcaFjkxxnzJRudGc9219zNLH7urpCiJAw@mail.gmail.com>
Subject: measuring the flash usage
From: Folkert van Heusden <folkert.van.heusden@gmail.com>
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

Hi,

For an embedded system I'm working on I'd like to monitor the health
of the flash memory.
On regular Linux systems one can look at /proc/diskstats to see how
often the system writes to a disk. It seems though that (at least
kernel 2.6.19) for flash these counters are not updated.
So I was wondering: are there any other ways?
E.g. will the kernel log a message when it has problems writing
to/reading from the flash memory? Are there any other counters
anywhere?

Thanks.

Folkert
