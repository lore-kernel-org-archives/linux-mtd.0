Received: from i3micro-gw1.dcs.net ([217.78.32.2] helo=mail.i3micro.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rgQh-0004OP-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 15:03:19 +0100
Message-ID: <3BC5A957.167577AE@i3micro.com>
Date: Thu, 11 Oct 2001 16:14:47 +0200
From: Arne Jonsson <arne.jonsson@i3micro.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS any erase sector?
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

Hello!

I have been trying to get a grip of JFFS (not JFFS2).
Is there any documentation out there that tells you how
to organize your flash re. partitioning?
Is there a need for any erasesector that GC might need
or can I just allocate 2MB-64kB for use by the filesystem.
The -64kB is for the small sectors that I don't know if I
can use. The example above is for a 2MB AMD flash.
For now I am using the "old" JFFS, i.e not using any MTD,
on uClinux for ARM7TDMI.
I will migrate to the one used with MTD any day now but it would
be nice to know what is happening.

Please, anyone??

Regards,
/Arne Jonsson

-- 
Arne Jonsson
i3 micro technology AB
Phone:+46-8-506 388 00
Fax:  +46-8-506 388 75
