Received: from school.cyberec.com ([202.153.122.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KFFz-0004Kg-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 10:26:36 +0100
Message-ID: <3D0EFB61.5000605@emsoftltd.com>
Date: Tue, 18 Jun 2002 17:20:33 +0800
From: Jason Chan <jason@emsoftltd.com>
MIME-Version: 1.0
To: Marius Groeger <mag@sysgo.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: How to configure MTD so that JFFS2 work on 7312 NandFlash?
References: <Pine.LNX.4.40.0206181118180.23166-100000@mag.devdep.sysgo.de>
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

I use the "eraseall" routine to erase the nand. The I use "mount 
/dev/mtdblock3 /mnt -t jffs2" to mount the flash. It takes 3-4 minutes.
After I successfully mounted, and copy some file to the flash and then 
umount. It very slow.
And it takes me 3-4 minutes even i mount that again.

What tools should I use to format and erase the flash properly?


Marius Groeger wrote:

>On Tue, 18 Jun 2002, Jason Chan wrote:
>
>>    Sorry, for my post. But it works now.
>>However, the performance is really very slow. When I try to mount the
>>Toshiba 8Mb nandflash. It takes me 3-4 minutes.
>>
>
>Maybe because it has not been properly erased and formatted?!
>
>Regards,
>Marius
>
>-----------------------------------------------------------------------------
>Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
>Software Engineering     Embedded and Real-Time Software    www.sysgo.de
>Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
>FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
>


-- 
Best Regards,

Jason Chan
Emsoft Ltd.
