Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Yw2p-0001hs-00
	for <linux-mtd@lists.infradead.org>; Sun, 28 Jul 2002 22:57:43 +0100
Message-ID: <3D446825.7482FE81@opersys.com>
Date: Sun, 28 Jul 2002 17:54:45 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Error in mtd/util/Makefile.am
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

There seems to be an error in the Makefile.am file for the utilities.
The instructions for building compr.c:
compr.o: compr.c
        $(COMPILE) $(CFLAGS) $(INCLUDES) -Dprintk=printf -DKERN_NOTICE= -c -o $@ $< 

should actually be:
compr.o: compr.c
        $(COMPILE) $(CFLAGS) $(INCLUDES) -Dprintk=printf -DKERN_WARNING= -DKERN_NOTICE= -c -o $@ $< 

There's a missing "-DKERN_WARNING=" which will result in a failed build.

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
