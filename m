Received: from rproxy.gmail.com ([64.233.170.203])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5fm4-0004xa-3C
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2005 02:57:04 -0500
Received: by rproxy.gmail.com with SMTP id y7so374268rne
	for <linux-mtd@lists.infradead.org>;
	Sun, 27 Feb 2005 23:57:01 -0800 (PST)
Message-ID: <f6d0cd06050227235769c791c8@mail.gmail.com>
Date: Mon, 28 Feb 2005 13:27:01 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: "C. Michael Sundius" <msundius@sundius.com>
In-Reply-To: <1f065e28ae2a88eda8f37b9c40f54ed2@sundius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <1f065e28ae2a88eda8f37b9c40f54ed2@sundius.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: utilities for mtd
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I think you must have tried flash_erase on a block device
(/dec/mtdblock0) but flash_erase will work only for Char Device. So
you can create a char MTD device by giving below commands.

mknod /dev/mtd0 c 90 0

Now try the flash_erase command, it should work.

Regds
Niraj


On Thu, 24 Feb 2005 11:34:34 -0800, C. Michael Sundius
<msundius@sundius.com> wrote:
> Hi,
> 
> I am using a the mtd code from the 2.4.20 kernel. how/where do I get
> the corresponding utilities
> such as flash_erase, flash_lock etc... I grabbed a random version of
> them somewhere and it
> didn't seem to work.. for one the flash_erase program calls an ioctl
> "MEMGETREGIONCOUNT"
> and my kernel returned:
>        in appropriate ioctl for this device....
> 
> any help is appreciated.
> 
> thanks
> 
> C Michael Sundius
> Solico Group LLC
> 232 Nevada St
> San Francisco, CA 94110
> msundius@sundius.com
> (415)608-0121
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
