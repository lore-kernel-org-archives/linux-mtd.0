Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0c6A-0000rS-Of
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 04:28:39 -0400
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <200408270210.53632.ccool@ninjatech.biz>
References: <200408270210.53632.ccool@ninjatech.biz>
Content-Type: text/plain
Message-Id: <1093595310.21861.18.camel@icampbell-debian>
Mime-Version: 1.0
Date: Fri, 27 Aug 2004 09:28:32 +0100
Content-Transfer-Encoding: 7bit
Subject: Re: Trouble with mtd partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If it helps (because I surely don't understand what's happenning), it is like 
> if the partition structure in the physmap.c was not taken count off.  

The example you said had the contents of the partition structure
definition surrounded with "#if 0" / "#endif". Perhaps you should change
that to a 1.

Also make sure you have the CONFIG_MTD_PARTITIONS turned on in your
config (and CONFIG_MTD_CMDLINE_PARTS for mtdparts= if that's your
thing).

Ian.
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
