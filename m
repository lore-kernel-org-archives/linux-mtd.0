Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tXcR-0007Qo-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2002 18:35:23 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g35HZKdu014595
        for <linux-mtd@lists.infradead.org>; Fri, 5 Apr 2002 11:35:20 -0600
Message-ID: <003f01c1dcc8$431f76f0$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: Adding a non-blocking erase func
Date: Fri, 5 Apr 2002 11:35:21 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello,

Say I wanted to write another erase function
that's ioctl callable. This function would 
be non-blocking.

Would it be good to:

1. add another define "MEMERASE_NDELAY,"

2. Go into the function mtd_ioctl, and
add a case for MEMERASE_NDELAY.

3. The case for MEMERASE_NDELAY
would be a copy of MEMERASE except with the 
wait_queue stuff taken out.

Would this be a simple task (in your opinion)
or would that be one of those things that
would be tricky to debug and get working?

Thanks, 
Derek.
