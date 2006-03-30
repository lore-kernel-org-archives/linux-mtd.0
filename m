Received: from mailwasher.lanl.gov ([192.65.95.54] helo=mailwasher-b.lanl.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FOykB-0003OV-K0
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 16:07:28 +0100
Received: from godiva.ta-18.lanl.gov (godiva.ta-18.lanl.gov [128.165.164.98])
	by mailwasher-b.lanl.gov (8.12.11/8.12.11/(ccn-5)) with ESMTP id
	k2UF74NU007966
	for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2006 08:07:04 -0700
Message-Id: <200603301513.k2UFD5G3010570@godiva.ta-18.lanl.gov>
Date: Thu, 30 Mar 2006 08:08:58 -0700
To: Benjamin Sapp <bsapp@lanl.gov>, linux-mtd@lists.infradead.org
From: Benjamin Sapp <bsapp@lanl.gov>
In-Reply-To: <200603271446.k2REkMG3017802@godiva.ta-18.lanl.gov>
References: <200603271446.k2REkMG3017802@godiva.ta-18.lanl.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Cc: 
Subject: Re: getting an older mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



In order to get an older CVS I had to checkout then perform "updates" 
specifying later and later dates.  When I found version 1.38 I compiled it 
on my fedora core 4 machine and all worked great after that.  I don't know 
exactly what the issue was...   I'll just continue with the older version 
until we move to version 2.6 of the kernel.

Ben

At 07:42 AM 3/27/2006, Benjamin Sapp wrote:
>Hello,
>
>I have version 1.38 of mkfs.jffs2 on a RedHat 7 machine and it works 
>perfectly.  I have  version 1.47 on a Fedora Core 4 machine and it does 
>not work.  I'd like a working version on the Fedora machine.  However, 
>copying the binary over did not work because of library 
>incompatibilities.  Do you know where I can find the source code thaHi t 
>would correspond to mkfs.jffs2 version 1.38?  Is there a command that 
>would allow me to get it from the CVS?
>
>Thanks for any help,
>Ben.
>
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
