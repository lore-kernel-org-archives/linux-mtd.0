Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178juV-0005y8-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 16:44:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <MDAEMON-F200205171026.AA261579MD57584@bitworks.com> 
References: <MDAEMON-F200205171026.AA261579MD57584@bitworks.com> 
To: "Richard A. Smith" <rsmith@bitworks.com>
Cc: "Ronald G Minnich" <rminnich@lanl.gov>,
    "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
    linux-mtd@lists.infradead.org
Subject: Re: Re[2]: linux boot time 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Fri, 17 May 2002 16:44:43 +0100
Message-ID: <9295.1021650283@redhat.com>
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

rsmith@bitworks.com said:
>  I think I posted some info about my experiences a while back.... that
> may have been on the embedded list though...

> David, how many other reports besides mine to you have of the CF's
> developing a problem?  We use both SanDisk and SST CF's in a couple of
> projects and most of our failures are during the development cycle.
> Go figure... 

There was Vipin Malik's writeup at http://www.embeddedlinuxworks.com/ but 
that doesn't seem to be there any more. He was actually doing powerfail 
testing on JFFS/JFFS2 and making me fix it when it broke, but he also did 
some on CF, and obviously could do nothing when it broke. Software is _so_ 
much nicer.

Charles Manning's rants about bog-roll technology¹ are too vehement to have 
been born from anything but personal experience as well, AFAICT :)

--
dwmw2
¹ http://mhonarc.axis.se/jffs-dev/msg01267.html
