Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17CguN-0002KQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 May 2002 14:21:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF72@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF72@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Append does not return error on full disks 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 May 2002 14:20:55 +0100
Message-ID: <1274.1022592055@redhat.com>
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

fgiasson@mediatrix.com said:
> 	I have observed that jffs2 nevers returns a 'disk full' error when an
> application appends data to an existing file.  I have setup a test
> which opens an existing file for appending, and fwrite() data to it
> until fwrite() returns error. My test never stopped!  So when I
> manually stoppped it, the file system was corrupted.  I was unable to
> unmount it, and neither I could remount it after reboot.  I have setup
> a second test which is a script instead of being a program, using the
> append '>>' command.  Same results. 

Eep. Can you reproduce this with the current code from either the trunk or 
the jffs2-2_4-branch, and with CONFIG_JFFS2_FS_DEBUG=1, logging all the 
messages via a serial console?

> 	During my test, I did'nt open the file with OSYNC flag though, maybe
> it could patch the problem.  I will try it.

Doesn't matter. O_SYNC does nothing -- it's always synchronous anyway.


--
dwmw2
