Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgjGR-0007a2-SD
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 07:37:21 -0500
Date: Tue, 21 Dec 2004 12:36:34 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1103632351.6111.67.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.61.0412211235350.3342@hex.linuxgrrls.org>
References: <a46577d50412131817139c1966@mail.gmail.com>
	<1103632351.6111.67.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Wang JinFeng <wangjinfeng@gmail.com>, linux-mtd@lists.infradead.org,
	uclinux-dev@uclinux.org
Subject: Re: Failed to implent MTD on uclinux(kernel version 2.4.20-uc0)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue, 21 Dec 2004, David Woodhouse wrote:

> On Tue, 2004-12-14 at 10:17 +0800, Wang JinFeng wrote:
>> ****Don`t know why this happen,somebody may give me some advice,thanks
>> ****kernel version 2.4.20-uc0
>> ****SoC:s3c4510b
>> ****Flash chip:am29lv160DB
>
> I'm led to believe that 2.4.20-uc0 on smdk2410 means a commercial port
> which is of fairly low quality. You'd probably do better to use a 2.6
> kernel instead. You may still need to do a little bit of work on it, but
> at least you'll be working from a sane starting point.

Why the hell would you be running uClinux on an s3c2410 anyway?  It's an 
ARM920T and has a real MMU.  It is very capable (and fast!) at running 
real Linux.

-J.
