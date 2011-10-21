Received: from mail.kernelconcepts.de ([212.60.202.196])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RHG8A-00037N-Jm
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2011 14:31:31 +0000
Received: from [192.168.2.163] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <daniel.wagener@kernelconcepts.de>)
	id 1RHGU8-0001n4-Q1
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2011 16:54:12 +0200
Message-ID: <4EA1823D.3040708@kernelconcepts.de>
Date: Fri, 21 Oct 2011 16:31:25 +0200
From: Daniel Wagener <daniel.wagener@kernelconcepts.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Subject: UBIFS and small dynamic files
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ahoi,

we are having trouble with the side effects of the UBIFS write buffer 
described in http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuffer
We have certain config files that are quite small and get rewritten very 
frequently by their applications.
Matchbox-panels' ~/.matchbox/mbdock.session is a fine example as it gets 
emptied on a power cut or hard reset resulting in an empty and therefore 
useless panel on the next start.

The document above mentions the '-o sync' option which disables the 
write buffer on a partition, but this is not an option for us because we 
do not want to reduce the write performance. And there is also the issue 
of a synchronously mounted UBIFS that can make things even worse in case 
of power cuts.



Has there been any further development to these issues since 2008?
