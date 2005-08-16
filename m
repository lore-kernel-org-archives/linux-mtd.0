Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E51MX-0008Vp-PN
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 09:20:21 -0400
Message-ID: <4301E7EC.70906@yandex.ru>
Date: Tue, 16 Aug 2005 17:19:40 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>,
	Thomas Gleixner <tglx@linutronix.de>
References: <42E5E816.5090500@inf.u-szeged.hu>	
	<20050726074440.GB15903@wohnheim.fh-wedel.de>	
	<42E5ECE5.4010901@inf.u-szeged.hu>	
	<20050726093215.GD15903@wohnheim.fh-wedel.de>	
	<20050726100330.GF15903@wohnheim.fh-wedel.de>	
	<42EDF04C.1010108@inf.u-szeged.hu>	
	<20050801095645.GA32464@wohnheim.fh-wedel.de>	
	<42EDF470.4060208@inf.u-szeged.hu>	
	<20050801104343.GB32464@wohnheim.fh-wedel.de>	
	<42EE2B78.70500@inf.u-szeged.hu>	
	<20050801141841.GD32464@wohnheim.fh-wedel.de>	
	<42FB68AE.6070805@inf.u-szeged.hu> <42FB732B.5040405@yandex.ru>	
	<42FB8402.5000705@inf.u-szeged.hu>
	<1123776399.16052.70.camel@sauron.oktetlabs.ru>
	<43007B6A.3040402@inf.u-szeged.hu> <43008930.5050405@yandex.ru>
	<4300CC8C.9090206@inf.u-szeged.hu>
In-Reply-To: <4300CC8C.9090206@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> It writes
> 
> [nandsim] errorr: write_byte: chip is disabled, ignore write
> 
> with its default configuration. It worked well earlier. Maybe there were 
> changes in mtd...
> 
Hmm, I also see this message. But nandsim still works just fine..

Thomas, nandsim issues a warning that one sends command to nand while it 
is disabled. Not sure, but isn't this patch should be applied to 
nand_base.c:

--- nand_base.c 2005-08-05 14:44:30.000000000 +0400
+++ nand_base_fixed.c   2005-08-16 17:13:41.620785252 +0400
@@ -2652,6 +2652,9 @@ int nand_scan (struct mtd_info *mtd, int

         mtd->owner = THIS_MODULE;

+       /* Select the device */
+       this->select_chip(mtd, 0);
+
         /* Reset the chip */
         this->cmdfunc (mtd, NAND_CMD_RESET, -1, -1);

At line 2621 we did:

         /* De-select the device */
         this->select_chip(mtd, -1);

so it seems logical to enable it before sending the reset command, isn't 
it ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
