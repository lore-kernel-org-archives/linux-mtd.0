Received: from [217.67.230.192] (helo=timmy.zylon.net ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18FF9A-0000lz-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2002 14:51:08 +0000
Message-ID: <20021122152105.20437.qmail@timmy.zylon.net>
From: "Erik Smit" <zoiah@zoiah.net>
To: linux-mtd@lists.infradead.org
Subject: GRUB
Date: Fri, 22 Nov 2002 15:21:05 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
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

Hi Everybody, 

I just installed grub-0.92 on a DOC Millenium, however this appears to have 
overwritten the original partition table: 

Could not find valid boot record
Could not mount NFTL device 

Since the documentation states "DO NOT EVER USE THE nftl_format UTILITY 
WITHOUT FIRST SEEKING ADVICE ON THE MAILING LIST. It will erase all blocks 
on the device, potentially losing the factory-programmed information about 
bad blocks. (Someone really ought to fix it one of these days - ed)", what 
should I do? 

Thanks in Advance, 

Erik Smit 
