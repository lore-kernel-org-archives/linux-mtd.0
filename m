Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AZ5WH-00069R-RW
	for linux-mtd@lists.infradead.org; Wed, 24 Dec 2003 09:41:33 +0000
Message-ID: <3FE95ECC.8010502@arcom.com>
Date: Wed, 24 Dec 2003 09:39:24 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <357032fbc0.2fbc035703@shaw.ca>
In-Reply-To: <357032fbc0.2fbc035703@shaw.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Unable to access JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -  cfi_cmdset_0002: Disabling fast programming due to code 
> brokenness.  Any patch to cfi_cmdset_0002.c to fix this.

I'm not aware of one.  It doesn't look like it would be that much of a
performance increase anyway.

> - When I accessed the mounted JFFS2 file system, I got "Chip not 
> ready after erase suspended".

Erase-suspends for AMD chips are broken in current CVS. I posted a patch
to the list earlier this month fixing it partitially and disabling the 
remainging broken bit (which decreased performance significantly).

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
