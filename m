Received: from real.realitydiluted.com ([208.242.241.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178KSU-0003QQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 13:34:15 +0100
Message-ID: <3CE3A703.7090001@realitydiluted.com>
Date: Thu, 16 May 2002 07:33:07 -0500
From: "Steven J. Hill" <sjhill@realitydiluted.com>
MIME-Version: 1.0
To: zeusj@firstlinux.net
CC: Subhash Chandra <schandra@sasken.com>, all in MTD mailinglist
 <linux-mtd@lists.infradead.org>
Subject: Re: NAND vs NOR Flashs?
References: <20020515033651.763F636F9@sitemail.everyone.net>
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

Jim Zeus wrote:
>>I would like to know the diff. between NAND and NOR flash types.
>>Any pointers are appreciated.
> 
> 
> The size of NAND flash (8-128M)is always bigger than NOR flash (1-16M);
> Reading a NOR flash is a little faster than NAND flash;
> Erasing and Writing a NAND flash is much faster than NOR flash;
> So NAND flash is more fit for storing data and NOR flash is more fit for storing code.
> And there is ECC (error correction) in NAND flash.
> You can access NOR flash with SRAM interface and you have to do it with I/O port to NAND flash.
> Those are some of the differences between NAND and NOR flash.
> 
> 
That's some of it. Read the post I had from a while back:

http://lists.infradead.org/pipermail/linux-mtd/2000-October/001270.html

-Steve
