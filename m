Received: from chrudim.coprosys.cz ([194.108.73.1] helo=ns3.coprosys.cz)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Fu4q-0006BL-00
	for <linux-mtd@lists.infradead.org>; Sun, 24 Nov 2002 10:33:24 +0000
Received: from wolfhill.cz (ctt2.cps.cz [194.108.73.202])
	by ns3.coprosys.cz (8.12.0/8.12.0) with ESMTP id gAOB3rdj021284
	for <linux-mtd@lists.infradead.org>; Sun, 24 Nov 2002 12:03:53 +0100
Message-ID: <3DE0B223.4090901@wolfhill.cz>
Date: Sun, 24 Nov 2002 12:04:03 +0100
From: Ales Makarov <ales.makarov@wolfhill.cz>
Reply-To: ales.makarov@wolfhill.cz
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: Re: Garbage collection failed
References: <20021122011236.8686.qmail@web21006.mail.yahoo.com> <23792.1037957630@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

I have seen this message also (on our DragonBall VZ based
board). But it appears only during shutdown/reset (when the
JFFS2 partition remains mounted and the GC thread is running).

Ales

David Woodhouse wrote:
 > inox_kas@yahoo.com said:
 >
 >>When I mount the JFFS2 I keep getting the following error:
 >>"jffs2: No clean _or_ dirty blocks to GC from! Where are they
 >>all?\n");
 >
 >
 > Does the mount fail, or does it just print this and 
continue working?
 >
 > --
 > dwmw2
 >
 >
 >
 > ______________________________________________________
 > Linux MTD discussion mailing list
 > http://lists.infradead.org/mailman/listinfo/linux-mtd/
