Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DDd6l-00027C-Jy
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 01:43:20 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 36306894002
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Mar 2005 17:43:13 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 696CE894002
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Mar 2005 17:43:12 +1100 (EST)
Message-ID: <423FBE7F.6090700@magellan-technology.com>
Date: Tue, 22 Mar 2005 17:43:11 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1ffb4b0705032109224f2c7805@mail.gmail.com>
In-Reply-To: <1ffb4b0705032109224f2c7805@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: mtd permission denied
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Lee wrote:
> Hi all
>   i tried to flash_erase and other flash_* tools to my mtd device, the
> return value is permission denied, but i am already root login. I have
> selected MTD_CHAR and MTD_BLOCK in kernel.  Do i miss somethings?
> 
>     My kernel version is 2.6.10, with cvs mtd patched.
> 
> Mike,Lee

This is spookey, I just got the exact same problem at the same time(!)

I'm trying to write data to my Dataflash device, but I get a "permission 
denied" error whenever I try to fopen the file "/dev/mtd/2" to write the data 
into it. I can read data from it with no problems.

I have tried "mtd_debug write" and "flashcp" and they return permission denied 
as well. Am I missing something?

I am using 2.4.27-vrs1 with cvs mtd patched.

/root # mtd_debug info /dev/mtd/2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_ERASEABLE
mtd.size = 786432 (768K)
mtd.erasesize = 1056 (1K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

regards,

Aras Vaichas
