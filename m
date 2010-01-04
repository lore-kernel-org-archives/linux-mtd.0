Received: from dcn237-231.dcn.davis.ca.us ([168.150.237.231]
	helo=rusty.jkmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NRs59-0001iO-J8
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 18:55:15 +0000
Received: from [10.10.1.107] (dcn237-230.dcn.davis.ca.us [168.150.237.230])
	by rusty.jkmicro.com (8.12.8/8.12.8) with ESMTP id o04HF3Df027199
	for <linux-mtd@lists.infradead.org>; Mon, 4 Jan 2010 09:15:03 -0800
Message-ID: <4B423990.6040607@jkmicro.com>
Date: Mon, 04 Jan 2010 10:55:12 -0800
From: Adam Yergovich <ayergo@jkmicro.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: M-systems DOC 2000
References: <20100104183407.NJYA21638.aamtaout02-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
In-Reply-To: <20100104183407.NJYA21638.aamtaout02-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Parkinson wrote:
> Hi,
> 
> I've been doing stuff with some old GEODE-based thin clients (circa 
> 2003) and have Linux running off CF cards on the IDE interface.  A 
> couple of them (Neoware Capio and Relisys RWT200EM) have DOC 2000s on 
> them (32Mb and 16Mb respectively) which hold the original WinCE firmware 
> and I thought it would be interesting to try and utilise these - however 
> Google has not been my friend here.
> 
> Currently I'm using Tiny Core and have rebuilt the kernel and included 
> MTD support along with the drivers for the DOC 2000.  I've got as far as 
> getting the message "No DiskOnChip devices found" in the start-up 
> messages.  I did wonder whether the M-systems DOS-based tool set 
> (v5.1.4.0?) would help me get a grip on things, but all the "download 
> from here" links that Google found link to the m-systems website that I 
> believe vanished some time ago.  How-to's that I've found are all 4-5 
> years old and generally refer to M-systems drivers and/or require 
> ancient kernels and specific compilers....  (I have however managed to 
> locate and download the device datasheets!)
> 
> I'd appreciate any pointers to any documentation or tools that would 
> help me with my quest.
> 
> Regards
> 
> David
> 

Can be tricky work dealing with the old systems.  I've done a fair 
amount of work with the Disk On Chip 2000, and my company even has them 
for sale if you need more.  We also have our own little toolbox for 
formatting and partitioning the drives, however its all setup to use our 
controllers so i'm not sure how much use it is to you.  You can take a 
look though:

www.jkmicro.com

http://www.jkmicro.com/downloads/zip/DiskOnChipToolbox.zip

It could just be that your DOC isn't formatted and thus not showing up, 
and i've also seen failed DOC that won't respond at all.  You might want 
to make sure you start with a fresh one.  I wouldn't be surprised if the 
old WinCE firmware on there used some wacky partitioning to obscure 
their executables.

If they are FAT formatted though you could plug them into one of our 
boards and at least get the executables off.

Hope this helps,

-Adam

-- 
Adam Yergovich
Engineer
JK Microsystems

1403 Fifth St. Suite D
Davis, CA 95616

Tel:(530) 297-6073
