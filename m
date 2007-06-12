Received: from cpe-124-178-235-43.static.vic.bigpond.net.au ([124.178.235.43]
	helo=brick.calyptech.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hy1qw-0006Ed-HZ
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 04:35:54 -0400
Received: from [192.168.1.87] (unknown [192.168.1.87])
	by brick.calyptech.com (Postfix) with ESMTP id 5C25090C007
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jun 2007 18:35:37 +1000 (EST)
Message-ID: <466E5B8F.60400@cloud.net.au>
Date: Tue, 12 Jun 2007 18:38:39 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Intel P33 NOR flash with CFI revision 1.5
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a new board with Intel P33 NOR FLASH which is reporting to have 
minor revision 5. The current driver refuses to deal with > 4.

I don't have any documentation on the new revision. However I hacked my 
source tree to allow version 5 and I can successfully read, erase and 
program the device. The kernel says:

IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
IXP4XX-Flash.0: Found an alias at 0x800000 for the chip at 0x0
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x20000,blocks=63
erase region 1: offset=0x7e0000,size=0x8000,blocks=4

(It's an 8Mb part.)

Does anyone know any more about it?

thanks,
Hamish
