Received: from imladris.infradead.org ([194.205.184.45] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173BzC-0003FY-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 09:30:46 +0100
Received: from mail010.syd.optusnet.com.au ([210.49.20.138])
	by phoenix.infradead.org with esmtp (Exim 3.35 #5)
	id 173Bz7-0003eV-00
	for linux-mtd@lists.infradead.org; Thu, 02 May 2002 09:30:42 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail010.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g428UcL24635
	for <mtd@infradead.org>; Thu, 2 May 2002 18:30:38 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=bigpond.com)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 173Bz3-0001hT-00
	for <mtd@infradead.org>; Thu, 02 May 2002 18:30:37 +1000
Message-ID: <3CD0F92C.3010306@bigpond.com>
Date: Thu, 02 May 2002 18:30:36 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: more docprobe.c
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

I also added the following:

#if (CONFIG_MTD_DOCPROBE_ADDRESS != 0)
    CONFIG_MTD_DOCPROBE_ADDRESS,
#elif defined(__alpha__) || defined(__i386__) || defined(__x86_64__)
...
#elif defined(__ppc__) || defined(__PPC__)
...
#elif defined(CONFIG_MOMENCO_OCELOT)
...



I think that the platform specific config option should be checked 
before (or within) the generic arch blocks.

#if (CONFIG_MTD_DOCPROBE_ADDRESS != 0)
    CONFIG_MTD_DOCPROBE_ADDRESS,
#elif defined(CONFIG_MOMENCO_OCELOT)
...
#elif defined(__alpha__) || defined(__i386__) || defined(__x86_64__)
...
#elif defined(__ppc__) || defined(__PPC__)
...


Regards,
Brendan Simon.
