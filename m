Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8z6w-0003ki-Tp
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 06:12:20 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D8z6U-000092-0j
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 12:11:50 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2005 12:11:49 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2005 12:11:49 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 09 Mar 2005 12:11:06 +0100
Message-ID: <d0mljs$evs$1@sea.gmane.org>
References: <d0jphc$re$1@sea.gmane.org>
	<1110365924.4353.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110365924.4353.3.camel@sauron.oktetlabs.ru>
Sender: news <news@sea.gmane.org>
Subject: Re: Many small files instead of one large files - writing, wearing,
 mount-time?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>Hence, me initial strategy was to have a file in NAND for each resource. 
>>However, I noticed that mount-time increased "severely" when many files 
>>were put on the device, and doing an "ls" first time on the 
>>device/directory took lots of time as well.
> Owing to its design JFFS2 works extremely slowly wit directories
> containing so many files.
 From IRC - just to keep the ML thread up to date:

egholm:   But could I make it faster by putting them into sub-directories?

dedekind: you could if the number of your subdirectories is small

dedekind: besically, JFFS2 uses the list to keep all the directory's 
children

dedekind: so, the performance is linear dependend on the number of children

egholm:   number of childrens - in one layer only? or accumulated children?

dedekind: in one layer

egholm:   super! Then that may be a solution! Thanx

// Martin

>>Unfortunately low mount-time is one of the factors giving the user a 
>>good experience with the system, so I started considering another 
>>strategy - namely one large file to hold all these states.
>>
>>However, I'm a bit concerned how fopen( ..., "rw" ) is handled 
>>underneith when I flush/sync the filedescriptor if I only mess with a 
>>small part of the file. Is the entire file flushed to NAND once more, or 
>>does Linux+JFFS2 handle this, and only write the parts (inodes) that are 
>>affected...
> 
> Don't worry, Only that "messed" peace will be flushed. The "large file"
> solution will be definitely faster.
> 
