Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IvfL-0000Aq-00
	for mtd-list@infradead.org; Wed, 17 Jan 2001 16:42:31 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14IvfK-0000Ak-00
	for mtd@infradead.org; Wed, 17 Jan 2001 16:42:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A65C7E4.FF2BC9D1@nexus-tech.net> 
References: <3A65C7E4.FF2BC9D1@nexus-tech.net> 
To: Kyle Harris <kharris@nexus-tech.net>
Cc: mtd <mtd@infradead.org>
Subject: Re: Newbie: archives and legal issues 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Jan 2001 16:41:54 +0000
Message-ID: <21663.979749714@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kharris@nexus-tech.net said:
>  Is there a searchable mail archive?

Nope, although the archives are downloadable in mbox format from 
ftp.infradead.org:/pub/mtd/archives

grep is your friend :)

> I'm sure this question has probably been beat to death. So, if there
> is someplace I can look for discussion, please let me know. Is it
> legal to use the FTL and/or NFTL on custom hardware (i.e., not
> M-System devices)?

Unless you live in the Free World or have a separate patent licensing 
agreement with M-Systems, FTL may only be used on PCMCIA devices, and NFTL 
only on M-Systems' own hardware.

But if you have custom hardware, why wouldn't you be using JFFS?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
