Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMhOw-0003uz-I7
	for linux-mtd@lists.infradead.org; Sun, 28 Nov 2010 13:34:47 +0000
Received: by wyf22 with SMTP id 22so3552718wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Nov 2010 05:34:44 -0800 (PST)
Message-ID: <4CF25A3C.2080307@gmail.com>
Date: Sun, 28 Nov 2010 14:33:48 +0100
From: Marek Skuczynski <mareksk7@gmail.com>
MIME-Version: 1.0
To: Vladimir Khmelnitsky <vladimir@broadlight.com>
Subject: Re: simple ubi reader
References: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AF55@mailsrv.broadlight.com>
In-Reply-To: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AF55@mailsrv.broadlight.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vladimir,
> But may be you know some simpler code performing ubi read. It looks to
> me rather complicated to cut out from u-boot, and even from barebox -
> code responsible only for ubi read dropping mtd staff.

Unfortunately, I don't know any simpler implementation of UBI driver.
However, I know that reading of an UBI volume content is not so
difficult to implement.
This should take about 2 days, which may be faster than adapting any
existing implementation.

Good luck,
  Marek

> Regards,
> Vladimir
>
> -----Original Message-----
> From: Marek Skuczynski [mailto:mareksk7@gmail.com] 
> Sent: Sunday, November 28, 2010 12:29 PM
> To: Vladimir Khmelnitsky
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: simple ubi reader
>
> Hi Vladimir,
>> I need to write bootloader which should read its second stage binary
>> from ubi volume.
>> I wonder if there is some simple open source code I can use to
> implement
>> ubi volume reader?
> I can take a look at these places:
> - U-boot <http://git.denx.de/?p=u-boot.git>
> - Barebox aka U-boot2 <http://git.pengutronix.de/?p=barebox.git>
>
> Regards,
>  Marek
>
>
