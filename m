Received: from code-monsters.com ([65.67.50.169] helo=smash.codemonsters.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ggYu-0001mT-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 06:30:36 +0000
Received: from ba.devicemonsters.com (adsl-65-70-211-41.dsl.austtx.swbell.net [65.70.211.41])
	by smash.codemonsters.net (8.9.3/8.8.7) with ESMTP id AAA14882
	for <linux-mtd@lists.infradead.org>; Fri, 1 Mar 2002 00:41:55 -0600
Date: Fri, 1 Mar 2002 01:49:59 -0600 (CST)
From: "Brian P. Austin" <baustin@codemonsters.net>
To: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Message-ID: <Pine.LNX.4.21.0203010137150.852-100000@ba.devicemonsters.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

OK.  I got past the != 1 part.  I used the 4.2 exb file from m-sys.

When I load the mtd and nftl modules I get this message.

Mar  1 01:31:38 ba kernel: mtd: Giving out device 0 to DiskOnChip 2000 
Mar  1 01:31:38 ba kernel: NFTL_notify_add for DiskOnChip 2000 
Mar  1 01:31:38 ba kernel: NFTL_setup 
Mar  1 01:31:46 ba kernel: Cannot calculate an NFTL geometry to match size of 0x3bf80. 
Mar  1 01:31:46 ba kernel: Using C:1023 H:16 S:15 (== 0x3bf10 sects) 
Mar  1 01:31:46 ba kernel:  nftla: unknown partition table 

This was after running nftl_format, which seemed to work.

as per the mtd-jffs how-to i ran fdisk on /dev/nftla.  When I wrote the
table my message file logged this.

Mar  1 01:42:20 ba kernel: invalidate: busy buffer 
Mar  1 01:42:20 ba last message repeated 17 times
Mar  1 01:42:20 ba kernel:  nftla: nftla1 
Mar  1 01:42:22 ba kernel: invalidate: busy buffer 
Mar  1 01:42:22 ba last message repeated 17 times
Mar  1 01:42:22 ba kernel:  nftla: nftla1 

I do not get an error when doing this however.  Fdisk exits normally.

then, here's the kicker.  When i run mke2fs /dev/nftla1 I get this
message SEVERAL TIMES.

Mar  1 01:36:09 ba kernel: e==1 to find free EUN to accommodate write to VUC 7182 
Mar  1 01:36:09 ba kernel: Argh! No free blocks found! LastFreeEUN = 7679, FirstEUN = 0 
Mar  1 01:36:09 ba kernel: Cannot make free space. 
Mar  1 01:36:09 ba kernel: NFTL_writeblock(): Cannot find block to write to 
Mar  1 01:36:09 ba kernel: NFTL write request failed 
Mar  1 01:36:09 ba kernel: end_request: I/O error, dev 5d:01 (unknown), sector 229822 
Mar  1 01:36:09 ba kernel: Argh! No free blocks found! LastFreeEUN = 7679, FirstEUN = 0 
Mar  1 01:36:09 ba kernel: No Virtual Unit Chains available for folding. Failing request 

I do not get any errors when running mke2fs.  Programm exits normally.

I'm sorry for the length of the message, but I want to make sure I don't
leave anything out.  I feel I'm very close to being able to ditch the
M-SYS DOC Driver.

any help would be greatly appreciated.

Thank you in advance

P.S.  I'm using a 288MB DOC 2000



Brian Austin
