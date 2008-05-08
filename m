Received: from yw-out-1718.google.com ([74.125.46.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JtwPc-00047Q-EW
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 03:03:16 +0000
Received: by yw-out-1718.google.com with SMTP id 5so598331ywm.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 May 2008 20:03:05 -0700 (PDT)
Message-ID: <48226D8F.3030603@gmail.com>
Date: Wed, 07 May 2008 23:03:43 -0400
MIME-Version: 1.0
To: Markus Wagner <Markus.Wagner@delec.de>
Subject: Re: Problems mounting jffs2 image on nor flash > Erase at 0x....
	failed	immediately: -EROFS. Is the sector locked?
References: <1423A303F72A2F4FB7801E51406342EA10ECCD@delec-server-01.DELEC.local>
In-Reply-To: <1423A303F72A2F4FB7801E51406342EA10ECCD@delec-server-01.DELEC.local>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
From: Vernon Sauder <vernoninhand@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Markus Wagner wrote:
> Hello,
>
> i have some problems to mount my jffs2 image on my NOR-Flash.
> I ported UBoot and Linux to my new board.
> So far UBoot works well but Linux has some problems to mount the flash.
>
> I can read from my flash with the dd command.
> But when I mount the flash with 'mount -t jffs2 /dev/mtdblock4 /mnt/' I get the error: 'Erase at 0x...... failed immediately: -EROFS. Is the sector locked?'
>
> Some Infos:
> Its an Intel P33 Strataflash.
>
> <SNIP>
>
> It seems to me that the kernel doesn't know that the flash is protected after power up.
>
> How can I get it to work?
> Where should I look at?
>
> Thanks for your help.
> Markus
>
>   
You did not mention exactly which device you are using. I just posted a 
patch to the list that added more StrataFlash devices to the fixup table 
so they are unlocked at power up.

See [PATCH] mtd: add more StrataFlash chip ids that need powerup fixup

Vern
