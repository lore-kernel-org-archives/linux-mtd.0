Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Y1Jo-00070v-00
	for mtd-list@infradead.org; Wed, 28 Feb 2001 07:46:40 +0000
Received: from [194.23.27.63] (helo=alpha.telia.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Y1Jm-00070p-00
	for mtd@infradead.org; Wed, 28 Feb 2001 07:46:38 +0000
Message-ID: <01C0A163.B059E710@STEFANLO>
From: Stefan Löfgren <stefan.lofgren@introducor.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Could not find valid boot record, DOC2000, 72MB
Date: Wed, 28 Feb 2001 08:51:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi....
I'm trying to get a DOC2000, 72MB working under 2.2.18...
The kernel compiled ok, after som work with it...
During boot the kernel finds the DiskOnChip2000 at address 0xD0000...
Fine...
But when NFTL is about to get mounted :

Could not find valid boot record
Could not mount NFTL device

The device have been formatted with nftl_format....
I found some mails in the archive that was discussing the same issue, but
there was no solution for the problem.
Is this only a problem with the 72 MB DiskOnChip?
Or have I done something else wrong?
Does anyone know what to do?

/Stefan







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
