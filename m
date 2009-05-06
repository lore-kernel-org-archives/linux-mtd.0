Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1b4B-0004Wh-2F
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 06:57:26 +0000
Message-ID: <4A013506.1090809@nokia.com>
Date: Wed, 06 May 2009 09:58:14 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Jacky Lam <jackylam.gsl@gmail.com>
Subject: Re: UBIFS recovery fail
References: <39811fe10905052311p53eaf0bcl4274e92ed030bbdd@mail.gmail.com>
In-Reply-To: <39811fe10905052311p53eaf0bcl4274e92ed030bbdd@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jacky Lam wrote:
> Dear all,
> 
> 	I have no idea why my UBIFS suddenly corrupted. But when I try to mount
> the UBIFS again, the following error appear:
> 
> 	UBIFS: recovery needed
> 	UBIFS error (pid 1057): check_lpt_type: invalid type (15) in LPT node
> type 2
> 	mount: mounting ubi0:fat on /mnt/fat failed: Invalid argument
> 
> 	Is there any way to recovery or let me clear the volume and mount again?

Unfortunately we do not have a program to fix corruption.

If you do not need anything from the file system, you can wipe the UBI volume
using the ubiupdatevol utility from mtd-utils with the -t option.  Then when
you try to mount UBIFS, it will automatically create an empty filesystem in
the empty volume.

However we would be very interested to learn more about your problem, so if
it is not too much trouble, would you be able to send us a complete bug
report as described here:

http://linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

Also, if possible could you make a copy of the volume with the corrupted
UBIFS file system and either email it (if it is very small) or make it
available for download somewhere.  You can do that using dd to read
from the UBI volume device node e.g. dd if=/dev/ubi0_1 of=corruptedfs
