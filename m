Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBQa3-0000xX-FZ
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2005 23:56:28 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id CBCF289404D
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Mar 2005 15:56:22 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 0904189404D
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Mar 2005 15:56:22 +1100 (EST)
Message-ID: <4237BC75.50903@magellan-technology.com>
Date: Wed, 16 Mar 2005 15:56:21 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <4237B14F.1080106@avantwave.com>
In-Reply-To: <4237B14F.1080106@avantwave.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Can not mount root on mtd block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mike wrote:
> Dear all
>    I am using kernel 2.6.10 with patched cvs mtd and my flash mapping 
> driver. I also add debug msg on mount_block_root. The return value is 
> ENXIO. I am really get mess , because the cfi proded the flash 
> successfully, but final result is "no such a device". Does anyone have 
> ideas on this?
... SNIP ...
> *VFS: Tried fs_name = <cramfs> err = -6*
> VFS: Cannot open root device "mtdblock2" or unknown-block(0,0)
> Please append a correct "root=" boot option
> Kernel panic - not syncing: VFS: Unable to mount root fs on 
> unknown-block(0,0)


What is your kernel cmdline? The error says that it doesn't understand your 
"root=" option.


regards,

Aras Vaichas
