Received: from [81.200.0.1] (helo=mail.su29.ru)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19u4ny-0004Ge-SK
	for <linux-mtd@lists.infradead.org>; Tue, 02 Sep 2003 07:38:18 +0100
Message-ID: <3F543ADF.4010805@mail.ru>
Date: Tue, 02 Sep 2003 10:38:23 +0400
From: dima <_pppp@mail.ru>
MIME-Version: 1.0
To: Matthew Dharm <mdharm@momenco.com>
References: <3F52FB48.3020908@mail.ru> <20030901121546.A26762@momenco.com>
In-Reply-To: <20030901121546.A26762@momenco.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: trouble with samsung drive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthew Dharm wrote:

>USB Mass Storage devices aren't handled via the MTD driver, generally.
>They are handled by the usb-storage driver via SCSI emulation.
>
Yeah, I figured out that it's an USB mass storage device when plugged it 
into my FreeBSD desktop at work. It was successfully detected as "Lexar 
Jumpshot".

>If the device shows up in /proc/bus/usb/devices with class code 8, then the
>USB low-level is working and it's time to move on to enabling the
>usb-storage driver.
>
/proc/bus/usb is empty. So, is this a problem with my USB hub? USB 
driver loads ok and detects the hub successfully though. My 1st question 
is still actual then: can USB 1.1 hub cooperate with USB 2.0 devices? 
The USB driver doesn't report any unclaimed devices as I mentioned in 
the previous post.

>The place for usb-storage help is linux-usb-users@lists.sf.net
>  
>
Thanks, I'll try this list.
