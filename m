Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Bd7Z-0003JX-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 15:38:33 +0000
Date: Tue, 12 Nov 2002 17:08:43 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Miraj Mohamed <miraj@procsys.com>
Cc: jffs-dev@axis.com, linux-mtd@lists.infradead.org
Subject: Re: mirroring in JFFS2
Message-ID: <20021112160843.GE5031@wohnheim.fh-wedel.de>
References: <3DD0D966.E6D877EC@procsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3DD0D966.E6D877EC@procsys.com>
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

On Tue, 12 November 2002 16:05:18 +0530, Miraj Mohamed wrote:
> 
>         Our system needs error detection and recovery of data on Flash.
> We selected Jffs2 which has in built CRC. And planning to modify
> Jffs2 code for mirroring. This means...each write and erase will be
> duplicated
> on mirror partition . While reading if a CRC error is detected,
> the mirror data will be read.
> 
>                     Can any one say if this implementation is ok (or is
> possible)?
> Have anyone implemented a similar system before? Any other way to attain
> redundancy?

Are you trying to put the mirroring stuff into jffs2?

In the hard disk world, people use md for this, which uses two devices
and returns one. The filesystem does not need to worry about anything.

Writing an mtd driver in that fashion should be pretty easy. Robert
Kaiser has done something similar already, have a look at the concat
layer.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
