Received: from web26305.mail.ukl.yahoo.com ([217.146.176.16])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EphQq-0004M9-Df
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2005 02:33:42 -0500
Message-ID: <20051223072659.11150.qmail@web26305.mail.ukl.yahoo.com>
Date: Fri, 23 Dec 2005 07:26:59 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: JFFS2 doesn't detect end of space on flash device instead breaks
	kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
      The JFFS2 on my flash doesnot report back to me
end of space on my flash, instead I get a kernel oops
message and sometimes the kernel hangs. This is when I
am trying to copy a file which is of larger size than
there is space on device.

       When I use the same method with JFFS it reports
to me end of space on device and comes out cleanly. 

        Is it a problem with the tool 'mkfs.jffs2' I
am using or is it problem the jffs2 image since I am
building this on a host PC

Thanks
Sreecharan.S


	
	
		
___________________________________________________________ 
Yahoo! Messenger - NEW crystal clear PC to PC calling worldwide with voicemail http://uk.messenger.yahoo.com
