Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9drv-0001jJ-U7
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 01:43:33 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: Narinder Kumar <narinder@kritikalsolutions.com>
In-Reply-To: <422C4B65.50804@kritikalsolutions.com>
References: <4222D35B.7070909@kritikalsolutions.com>
	<1109667284.4420.18.camel@fuzzie.sanpeople.com>
	<422C4B65.50804@kritikalsolutions.com>
Content-Type: text/plain
Message-Id: <1110523058.22517.7.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 11 Mar 2005 08:37:39 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: SPI DataFlash interfacing using 2.4.27-vrs1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Narinder,

Sorry for the late reply.

> I tried out mtd-snapshot-20050217.tar and latest one also but still not 
> able to get rid of my problem.

Either of those should work - the DataFlash support was merged before
then.


> If there is something crucial that i am missing out please let me know. 

There is one item I think I forgot to mention.

In the at91_dataflash.c driver, change the line:
    device->type = MTD_NORFLASH;
to
    device->type = MTD_DATAFLASH;

Then also make sure you have "JFFS2 write-buffering support" enabled in
the configuration.  (It's under the File Systems menu).

You should see the message "JFFS2 write-buffering enabled" printed to
kernel log when you mount the partition.  If you don't see it, the
Dataflash support is not correctly enabled.


Regards,
  Andrew Victor
