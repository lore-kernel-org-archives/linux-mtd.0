Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rLJW-0001pI-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2002 17:35:02 +0100
Date: Tue, 17 Sep 2002 18:35:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?B?qkyt171u?= <gamble@wamis0.cse.nsysu.edu.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: the problem of mounting a writeable partition
Message-ID: <20020917163500.GA24980@wohnheim.fh-wedel.de>
References: <Pine.BSF.4.21.0209172303590.14573-100000@wamis0.cse.nsysu.edu.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.BSF.4.21.0209172303590.14573-100000@wamis0.cse.nsysu.edu.tw>
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

On Tue, 17 September 2002 23:39:20 +0800, ªL­×½n wrote:
> dear all 
> 	I have problems about mounting a writeable partition.
> 	when I create a partition which capacity is larger than 2MB and
>         mount it with JFFS2 filesystem , it works well .
>         But when I create a partition which capacity is smaller than 2MB
>         and mount it , I can't create any file on it.
> 	I try to make a  directory on it , it displays the following error
>         message :
> 	
> 	mkdir: Cannot create directory `test': No space left on device
> 	
> 	Is there any limitation about the partition size.

Not directly. But jffs2 currently needs 5 extra eraseblocks for safe
operation. One is the obvious minimum for any log structured
filesystem, the rest is added for safety, since noone has _proven_
jffs2 to work with less.

I guess, your filesystem size plus five eraseblocks exceed 2MiB.

You should find some information here:
http://sources.redhat.com/jffs2/

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
