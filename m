Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OREQo-0007aR-42
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 01:07:11 +0000
Received: by pwi1 with SMTP id 1so1332523pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jun 2010 18:07:08 -0700 (PDT)
Message-ID: <4C215E35.7050503@taitradio.com>
Date: Wed, 23 Jun 2010 13:07:01 +1200
From: Robin Gilks <robin.gilks@taitradio.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Progress but stuck on write_buffers/write_words without fixup
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK - I've found a lot of the issues with updating 5 years in one hop - 
mtdblocks start from 1 because 0 is the whole phys mapped device, name 
of the partition list is hardcoded to 'phys' but I've still got a 
problem with the ST Micro M28W640ECB not supporting write_buffers in a 
CFI compliant fashion - I can get round it by setting the 
FORCE_WORD_WRITE in cfi_cmdset_0001.c but I'm hoping someone can tell me 
there is a better way

Cheers

-- 
Robin Gilks
Senior Design Engineer
Tait Radio Communications
DDI: 64 3 3571569
www.taitradio.com
robin.gilks@tait.co.nz
TAIT: THE RIGHT FIT
