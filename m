Received: from 35.9.233.220.exetel.com.au ([220.233.9.35] helo=mail.twotoe.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H3hCL-0002vS-Dx
	for linux-mtd@lists.infradead.org; Sun, 07 Jan 2007 18:13:08 -0500
Message-ID: <1ba401c732b1$5c65bcc0$7305a8c0@twotoe.com>
From: "marks twotoe.com" <marks@twotoe.com>
To: <linux-mtd@lists.infradead.org>, <openbios@lists.openbios.org>,
	<jffs@axis.com>
Subject: Cisco Content Engine ce507 Flash bios and boot
Date: Mon, 8 Jan 2007 10:12:54 +1100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are a lot of Cisco ce507 content engines going very cheap on the big 
auction at the moment.

You can even pick one up on ebay for as low as ~$10AU if you are dillegent 
enough watching the auctions.

Although they are obsolete for there intended purpose the hardware is very 
cool.

The ce507 contain:
P3/600 cpu
256 meg ram
symbios 83C895 with 18gig deathstar drive
asiliant 69000 video chip,
1 IDE port
Floppy port
i8042 kb/mous interface
2 standard comports.
2 intel e100 (82559) network interfaces.

The chipset is 443BX with a PIIX4E.

The bios is a general software job, possibly with video/mouse/keyboard 
handling removed.

All video goes out the console port (com1) at 9600, as does the input from 
the kb/mouse.

The video and keyboard/mouse ports are availible via headers.

Although the kernel detects the i8042 and the asiliant video, I am unable to 
get any video besides a cursor and no input from the kb/mouse happening.

The flash chips are 82F128J and a 82F400B and there is an altera EPM7032 
sitting between them.

One of the flash chips is for the bios, the second is for the boot.

There is also a 93C46 1K microwire eeprom onboard.

If you access the bios at post and set the boot device to other than flash 
you can boot floppy/ide/scsi.

In this way I have slack up and running on sda.

I also have zeroshell and ubuntu pyramid running off a cf card plugged into 
ide0.

I used a boot floppy and scsi cd to install slack.

After that long winded background my 2 questions are:

Has anyone managed to put openbios on one of these or similar boards?

Has anyone managed to access the boot flash on one of these or similar 
boards?

If so, what is the proceedure?


Best regards,
Marks  < m a r k s @ t w o t o e . c o m >
