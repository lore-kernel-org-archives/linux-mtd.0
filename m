Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9ILW-00060L-Ic
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 07:07:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Michael McLellan <michael-mclellan@swsa.com.au>
In-Reply-To: <Pine.LNX.4.53.0310141537460.12298@slop.cobalttech.com>
References: <Pine.LNX.4.53.0310141537460.12298@slop.cobalttech.com>
Message-Id: <1066111607.3172.40.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 14 Oct 2003 07:06:47 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: DoC Grub booting problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-14 at 15:44 +1000, Michael McLellan wrote:
> I've compiled grub v.0.93 with the lastest MTD patch and it pretty much
> works. But it doesn't detect the DoC until I explicitly tell it its there.

I believe that's intentional; it doesn't go looking for the drive until
it's asked to access it.

> So my question is, how come it doesn't detect the DoC before searching for
> the menu.lst file? So then it will boot without going to the Grub shell.

Don't you have to tell it that the menu.lst file is on (dc0,0) (what do
you use your _other_ partitions for, btw?) to make it look there?

-- 
dwmw2
