Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlNNE-0003xG-LX
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 07:11:00 +0000
To: manningc2@actrix.gen.nz
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	<20040127042233.C8D0416623@desire.actrix.co.nz>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 27 Jan 2004 00:13:06 -0700
In-Reply-To: <20040127042233.C8D0416623@desire.actrix.co.nz>
Message-ID: <m3hdyhuanx.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning <manningc2@actrix.gen.nz> writes:

> 
> First up: Do you really need a full-blown file system? Maybe something more 
> along the lines of a linear file store is more suited. Maybe too just some 
> basic storage in binary partitions.

As I don't have one at the moment I don't.  At the moment I am considering
my options.  I am looking at having several different pieces of firmware
by different authors so a filesystem would be useful.
 
> YAFFS is not really designed for NOR, though it has been used for NOR. For 
> the sizes you're talking about YAFFS would not really be a good choice 
> because the file headers use one "chunk" per file. THis eases garbage 
> collection, but swallows flash.

Thanks, that was my impression but having it confirmed is appreciated.

Eric
