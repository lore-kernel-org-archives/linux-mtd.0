Received: from venus.webvis.net ([128.242.238.143] helo=eware.com.sg)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177pnn-0001GR-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 04:50:11 +0100
Message-ID: <3CE24BAC.1040005@eware.com.sg>
Date: Wed, 15 May 2002 19:51:08 +0800
From: yuanfei <yuanfei@eware.com.sg>
Reply-To: yuanfei@eware.com.sg
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD on L7205DB and AM29LV160DT
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello, I am currently trying to turn on MTD driver for above hardware 
configuration.
I have turn on:
MTD core support
ROM chips in bus mapping
CFI support
physical mapping of flash chip.

but after boot my kernel, there is nothing happen to the MTD driver. It 
seems it does not working at all.

does any one can tell me what kinds of config I should use. to make it 
working??

thanks.
