Received: from mailhost.rdmcorp.com ([204.225.180.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17oQZt-0008Ai-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2002 16:35:53 +0100
Received: from PARKER (10.1.2.1) by mailhost.rdmcorp.com (Worldmail 1.3.167) for linux-mtd@lists.infradead.org; 9 Sep 2002 11:39:38 -0400
From: "Jack Lu" <jlu@rdmcorp.com>
To: <linux-mtd@lists.infradead.org>
Subject: about CFI flash
Date: Mon, 9 Sep 2002 23:33:13 -0400
Message-ID: <DFEAJMIABOLKNEBOPGDHKEBMCBAA.jlu@rdmcorp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi

The CFI flash memory can enter CFI query mode when the system writes CDI
Query command 0x98, to address 0x55,, any time
the device is ready to read array data. My question is:

The CFI flash memory can enter CFI query mode when the system writes CDI
Query command 0x98, to address 0x55,, any time
the device is ready to read array data ,
only when the falsh is erasend and in blank
or even if the flash has been programed and the memory at  address 0x55
coontains any data?

Thanks.
