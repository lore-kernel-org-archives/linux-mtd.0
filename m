Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gfv5W-0005fA-95
	for linux-mtd@lists.infradead.org; Fri, 03 Nov 2006 04:11:50 -0500
Received: by ug-out-1314.google.com with SMTP id m2so355393uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Nov 2006 01:11:43 -0800 (PST)
Message-ID: <305035a40611030111x742328b5s4eadf2474be94bc@mail.gmail.com>
Date: Fri, 3 Nov 2006 10:11:42 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: femi@firstmilesolutions.com
Subject: Re: MTD/Compact flash question
In-Reply-To: <14970641.101161632456658.JavaMail.kingpin@ARCHANGEL>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <14970641.101161632456658.JavaMail.kingpin@ARCHANGEL>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2006/10/23, femi@firstmilesolutions.com <femi@firstmilesolutions.com>:
> I'm looking for some information about using MTD with a commercial Compact Flash card. I've been supporting a deployed solution that uses a linux single board computer running off a 256 MB commercial compact flash card for the last 3 years or so, and we recently (within the last 4 months) switched to using MTD and JFFS2. The system is configured with 2 read only partitions (89 MB and 1MB, both using the ext2 filesystem) and a 156 MB read/write data partition (JFFS2 on top of MTD).
>
> Recently, we've observed a number of DriveReady/DriveSeek/DriveWrite errors from the JFFS2 partition when we try to erase, format and mount it. The flash_erase call hangs, and spits out a series of DriveWrite errors. When we cancel the erase, the mkfs.jffs2 call to format the partition completes without reporting any errors, but the attempt to mount throws a "bad superblock" error.
>
> As far as I can understand, this is using MTD on top of the IDE layer. My questions are:
> 1. If using a commercial Compact Flash card (through the IDE interface), is the MTD/JFFS2 layer necessary? It was deployed as a means of getting wear levelling done, but from reading through the list archives it looks like the wear levelling is typically already done by the Compact Flash card and we might as well just make the last partition ext2, mount it with the noatime option and call it a day.

As you must have read it, CF card mask the access of their flash, so
MTD/JFFS2 can't optimise access to nand. Using MTD/JFFS2 on top of the
IDE will just give you poor performance without a gain for wear
levelling: CF emulate IDE for MTD which emulate flash for JFFS2!
ext2 and noatime is the best solution indeed.

> 2. Does this depend on the Compact Flash card in use?

There are some vendors who sell "professional" CF which clearly claim
they use wear levelling. Other CF don't say anything on it but it
don't mean they have no wear levelling, we just don't know.

> 3. Is there any way to get more information about the state of the compact flash card, so my application code can tell when the CF card has reached the end of its useful life (as opposed to now, when I simply wait until the entire computer starts throwing errors).

You can ask the CF how many space it have, when it decrease faster you
can suppose the CF card will soon reach the end of its useful life.

> Thank you,
> Femi.
>
-- 
Gregory CLEMENT
Adeneo
