Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElooM-0008Ly-VI
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2005 09:38:00 -0500
Message-ID: <439D8BAD.3000105@gmail.com>
Date: Mon, 12 Dec 2005 15:39:41 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <438C7B0C.5040001@gmail.com> <438C94BD.8020300@inf.u-szeged.hu>
	<438C98EA.70105@gmail.com>
In-Reply-To: <438C98EA.70105@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
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

Hi,

>>> JFFS2 is claimed to be powerfail-safe. That's true as far it will 
>>> _always_ mount, nodes are CRC-protected and scanned at Mount/GC.
>>> But what about write buffering on NAND? Doesn't this break lots of 
>>> the powerfailsafe-efforts? All the data in the writebuffer will be 
>>> lost. Assuming we are updating a logfile with small data portions. 
>>> The portions accumulate in wbuf, waiting to reach c->wbuf_pagesize so 
>>> that the buffer is written to flash. Powerfail: all these small 
>>> updates can be lost. Hm...
>>
>> I think you are right. But anyway, if you call "sync" all data will be 
>> flushed. Unfortunatelly NAND can be written only by page, so the end 
>> of the wbuf will be filled a padding node. It is a little flash 
>> wasting, but the data will be written out immediatelly.

When is NAND wbuf flushed?
sync()
fsync()
fflush()?
fclose()?

Thanks,
Bernhard
