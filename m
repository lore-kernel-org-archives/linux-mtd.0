Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181Zkk-00086F-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 23:01:27 +0100
Received: from nwd2gtw1 (unverified) by nwd2mime2.analog.com
 (Content Technologies SMTPRS 4.2.10) with SMTP id <T5df5a0386f894719720c2@nwd2mime2.analog.com> for <linux-mtd@lists.infradead.org>;
 Tue, 15 Oct 2002 18:01:16 -0400
Received: from golf.cpgdesign.analog.com ([137.71.139.100]) by nwd2mhb1.analog.com with ESMTP (8.9.3 (PHNE_18979)/8.7.1) id SAA20434 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 18:01:11 -0400 (EDT)
Received: from ws4.cpgdesign.analog.com (ws4 [137.71.139.26])
	by golf.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id PAA22582
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 15:01:10 -0700 (PDT)
Received: from analog.com (localhost [127.0.0.1])
	by ws4.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id PAA18940
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 15:01:10 -0700 (PDT)
Message-ID: <3DAC9026.B3F4550B@analog.com>
Date: Tue, 15 Oct 2002 15:01:10 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Hoping for a little insight
Content-Type: text/plain; charset="us-ascii"
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

Hopefully someone can lend a little insight into what I'm seeing:

I am trying to copy a largish file (well, relative to the flash size)
and after a variable point in the copy, "cp" goes to sleep and never
wakes up again.

My configuration:

Linux Kernel 2.4.16
MTD code as ships w/ above kernel
MIPS Architecture
ST 29W320DB Flash (4 MB)
JFFS2 File System
625000 Byte file (copy of compressed kernel)

I've noticed that a number of SIGHUP's are delivered during the copy,
but they stop about the same time the process is left permanently
asleep. 

Any suggestions/insight/etc?

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
