Received: from imladris.infradead.org ([194.205.184.45] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173AX7-00038t-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 07:57:41 +0100
Received: from mail005.syd.optusnet.com.au ([210.49.20.136])
	by phoenix.infradead.org with esmtp (Exim 3.35 #5)
	id 173AX4-0003GT-00
	for linux-mtd@lists.infradead.org; Thu, 02 May 2002 07:57:39 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail005.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g426vXx13354
	for <mtd@infradead.org>; Thu, 2 May 2002 16:57:34 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=bigpond.com)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 173AWy-0005dr-00
	for <mtd@infradead.org>; Thu, 02 May 2002 16:57:32 +1000
Message-ID: <3CD0E35B.4010606@bigpond.com>
Date: Thu, 02 May 2002 16:57:31 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: docprobe.c on PowerPC
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

There a bug in MTD and/or Linux and/or gcc for docprobe on PowerPC 
machines.  I have a pretty recent linux.2.4.18-pre8 kernel from the 
bitkeeper linuxppc_devel archives.  It seems that when setting up 
doc_locations[] that the #elif defined(__ppc__) is not executed.  The 
gcc specs file does not mention this definition.  I did a gcc -v on a 
test file and it seems that -DPPC -D__PPC and -D__PPC__ are defined but 
not -D__ppc__.  Other architectures in the docprobe.c file use 
__alpha__, __i386 __x86_64__, etc.  Where do these definitions come from 
(or where are they supposed to be defined) ?  In GCC, the linux kernel 
or should the MTD code use __PPC__ instead ???

Thanks,
Brendan Simon.
