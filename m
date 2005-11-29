Received: from smtprelay02.ispgateway.de ([80.67.18.14])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhAuI-00064g-GO
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 14:12:58 -0500
Message-ID: <438CA82F.50600@gmail.com>
Date: Tue, 29 Nov 2005 20:12:47 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <438C7B0C.5040001@gmail.com> <438C94BD.8020300@inf.u-szeged.hu>	
	<438C98EA.70105@gmail.com>
	<625fc13d0511291107t3495a41byae11ba1832657291@mail.gmail.com>
In-Reply-To: <625fc13d0511291107t3495a41byae11ba1832657291@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND write buffering
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The assumptions seem to be fine.  The usage case you described is
> probably the worst case for JFFS2 though.  Lots of small writes
> generates lots of data nodes, which in turn increases mount time and
> wastes space.  EBS helps with the mount time issue, but the flash
> space consumption is larger than it probably needs to be.  But as you
> correctly pointed out, there is nothing you can do about that if you
> _must_ have it be on flash after every write.

Hehe... I'd say: rather use the flash unefficiently (sizeof(header) >> 
sizueof(data)) than loose data!

Bernhard
