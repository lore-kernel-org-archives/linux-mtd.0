Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CESrU-0006sk-K8
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 09:26:46 -0400
Message-ID: <41614F6B.6050802@yandex.ru>
Date: Mon, 04 Oct 2004 17:26:03 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <416122A1.4060302@oktetlabs.ru>	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	<4161379C.3070109@oktetlabs.ru>
	<1096893405.22034.9.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1096893405.22034.9.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityuckiy <dedekind@oktetlabs.ru>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [OBORONA-SPAM]  Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Yes and no.  It makes sense for any flash device that you can't write to
> the same page multiple times without an erase in between.  NAND is
> certainly the largest group of such devices.  There are others that have
> this behavior as well.  See cfi_cmdset_0020.c.

The original idea of ICPs (inode checkpoint) is to improve JFFS2 
performance on NAND not because the page can't be written lots of times.
The NAND flash specific is that there is constant delay when accessing 
any page.

For example consider TOSHIBA TC5DxM82A1xxxx 8-bit 256 Mbit NAND flash.
Page access delay is 25 microsecs.
Read cycle is 50 nanosecs.

When you read 3 bytes from this NAND flash and these bytes are situated 
in one page (consequently), you will spent about 25 microsecs + 50 * 3 
nanosecs.
But when you read those 3 bytes from the same NAND flash and these bytes 
are situated in three different pages, you will spent about 25*3 
microsecs + 50 * 3 nanosecs.

So, when the inode cache is built, we read node headers from *different 
pages*. But if there is checkpoint, we read from few pages. This is the 
main idea.

But in case of regular file inodes we also save *additional* time since 
we don't check the *data* CRC for those nodes, which are in 
checkpoint(s). In case of the directory inode there is no such 
additional time savings.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
