Received: from web52207.mail.yahoo.com ([206.190.39.89])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxPBK-0005WD-DS
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 08:04:48 -0400
Message-ID: <20040818095427.14738.qmail@web52207.mail.yahoo.com>
Date: Wed, 18 Aug 2004 02:54:27 -0700 (PDT)
From: Ed Co <edityacomm_knb@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Questions about the MTD driver for SHARP flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am looking at the driver for the Sharp LH28F016SCT
chip. If I understand the size of this chip is 2 Mega
bytes. But in the MTD driver code mtd->size is
declared as 8M and the chip shift is declared as 23. 
If I understand correctly mtd->size is supposed to
specify size in bytes.(At least that is how AMD flash
drivers seem to be doing) Am I missing something here?

Thanks in advance
Editya


		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 
