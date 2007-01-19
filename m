Received: from 42.242.232.72.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7uvJ-0007hJ-5A
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 09:41:01 -0500
Message-ID: <59166.127.0.0.1.1169217567.squirrel@localhost>
In-Reply-To: <200701190824404064520@163.com>
References: <200701190824404064520@163.com>
Date: Fri, 19 Jan 2007 16:39:27 +0200 (EET)
Subject: Re: samsung nand jffs2 errors
From: eugene.kozlov@promwad.com
To: "howhowwork" <howhowwork@163.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi howhowwork

Yes i use flash_eraseall -j /dev/mtd/1 as you can see it in nanddump i
just forgot to write it in message

For me its not a clear to understand what is happening because when i
increase chip_delay - it not solve the problem but using delay between
jffs2_check_nand_cleanmarker solve this.

I have some question:
In nand.h:
 * @dev_ready:          [BOARDSPECIFIC] hardwarespecific function for
accesing device ready/busy line
 *                      If set to NULL no access to ready/busy is
available and the ready/busy information
 *                      is read from the chip status register

But i see only using chip_delay when ready/busy pin not available:
                if (!this->dev_ready) {
                        udelay (this->chip_delay);
                        return;
                }
So i need to realise in hardwarespicific function @dev_ready read from the
chip status register or this should be done in nand_base.c?????
Because if first it's need to implement read things from nand_base.c in
hardwarespecific function and this not good practice!!!!

thanx

> Hi  eugene
> To prepare jffs2 image i use: mkfs.jffs2 -o jffs2_image -s 512 -e 16384 -d
>> jffs2_dir -p 0x4000 -n
>> I erase flash with "flash_eraseall /dev/mtd/1" from mtd utils and copy
>> image to flash by nandwrite.
>
> "flash_eraseall /dev/mtd/1 " you maybe use "flash_eraseall -j  /dev/mtd/1"
> when jffs2 scan eraseblock ,it do not need to write the message "OOB Data:
> ff ff ff ff ff ff ff ff 85 19 03 20 08 00 00 00"
>
>
>
>
> howhowwork
> 2007-01-19
>
