Received: from sccrmhc11.comcast.net ([204.127.202.55])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kVuH-0006cK-5H
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 22:33:17 +0100
Message-ID: <3F317459.1060300@mvista.com>
Date: Wed, 06 Aug 2003 17:34:17 -0400
From: "George G. Davis" <gdavis@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Add cmdlinepart and default static partition table support for ARM
 Integrator
Reply-To: davis_g@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

The attached patch adds cmdlinepart and default static partition table support
to integrator-flash. I've tested this on an ARM Integrator/AP with CM920T
core module. The patch is against recent MTD CVS checkout +/- 1 day. I'ld like
to get this committed to the MTD CVS repository. TIA!

--
Regards,
George
