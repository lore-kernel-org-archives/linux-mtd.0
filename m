Received: from mailserver.arcom.co.uk ([194.200.159.162])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EqiV-0006HO-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 12:09:12 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: "kira brown" <kira@linuxgrrls.org>
Cc: <linux-mtd@lists.infradead.org>,
	"Bao C. Ha" <baoha@sensoria.com>
Subject: RE: Disk-On-Module
Date: Tue, 26 Jun 2001 12:12:39 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEGEBMCNAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0106251732570.1186-100000@carrot.linuxgrrls.org>
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

>>> How do I build a JFFS2 on Disk-On-Modules?  Or
>>> any flash-based ATA/IDE devices?
>>
>>You don't.  They have their own wear levelling, journalling flash
>>translation layer built into them.  You just use them as discs.

Certainly wear levelling, and with ECC. This 'journalling' term seems
to be bandied around at levels ranging from block access up to
application data coherency. As far as I am aware the DOM will retain
all but the last 512b sector written in a power fail condition. Does this
count as journalling ?

-Alex


>>-----Original Message-----
>>From: linux-mtd-admin@lists.infradead.org
>>[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of kira brown
>>Sent: 25 June 2001 5:33 PM
>>To: Bao C. Ha
>>Cc: linux-mtd@lists.infradead.org
>>Subject: Re: Disk-On-Module
>>
>>
>>
>>
>>On Mon, 25 Jun 2001, Bao C. Ha wrote:
>>
>>> How do I build a JFFS2 on Disk-On-Modules?  Or
>>> any flash-based ATA/IDE devices?
>>
>>You don't.  They have their own wear levelling, journalling flash
>>translation layer built into them.  You just use them as discs.
>>
>>kira.
>>
>>
>>______________________________________________________
>>Linux MTD discussion mailing list
>>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
