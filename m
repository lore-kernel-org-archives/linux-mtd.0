Received: from proliant.sysinno.se ([195.163.21.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ZxY1-0001bI-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 17:41:37 +0100
Received: from [195.163.21.41] by proliant.sysinno.se (NTMail 4.30.0012/NT0065.00.f980be18) with ESMTP id khfqaaaa for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 18:43:29 +0200
Message-ID: <3B8533A2.8BA7729C@possio.com>
Date: Thu, 23 Aug 2001 18:47:30 +0200
From: Stefan Thomasson <st@possio.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Question about cfi_cmdset_0001.c
Content-Type: text/plain; charset=us-ascii
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

Hello,

I have discovered some problems with the strataflash memory and resets 
on our board (strongarm assabet clone), 
and after looking in this file I discovered that after erasing and
writing, the
state of the chips are left in FL_STATUS. 

Which in our case results in the status is output after reset if it
happens before any reads from flash.

Is there a reason not to enter read array mode / FL_READY.

Best regards

Stefan Thomasson
