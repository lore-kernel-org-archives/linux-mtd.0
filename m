Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G3V6e-0000gG-Kh
	for linux-mtd@lists.infradead.org; Thu, 20 Jul 2006 05:46:12 -0400
Date: Thu, 20 Jul 2006 11:45:58 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: how to use jff2 on UBI layer?
Message-ID: <20060720094558.GA30897@wohnheim.fh-wedel.de>
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com,
	'Marteo Tim' <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 July 2006 11:42:01 +0900, Kyungmin Park wrote:
> 
> Is there any easy way?
> 
> It's too dificult to mount jffs2 on ubi

As of now, it is impossible, sorry.  UBI exports an interface
completely different from MTD, so JFFS2 cannot work on UBI.  What I
used was a glue layer, called gluebi, that converts the UBI interface
into an MTD interface.  But in its current form, that is still
unacceptable, so I'm working on changing the code.

<details>

Right now, gluebi exports a function for jffs2 to find a device by
name.  This function tries UBI first and - if it finds one, exports
the UBI as an MTD for jffs2 to use.  Now you have an mtd and can also
see in via /proc/mtd, open the mtdblock or mtdchar devices for it,
etc.

When you unmount, the usage count drops to zero and the MTD device
gets removed.  No longer do you see a trace in /proc/mtd or can you
open mtdblock or mtdchar devices.

Unless you opened one of the devices while jffs2 was mounted.  Then
the usage count stays up and you can continue to use the device.

And if this happens, please don't think about mounting the same device
again, as gluebi would create a _second_ MTD for the same UBI.
Welcome to the world of pain.


As the above clearly is nothing to be proud of, I'm currently working
on opening an MTD device for every UBI volume.  This requires to deal
with reference counting in two places, MTD and UBI, and many
interesting race conditions.  It also found me wondering why we need
to do the refcounting in two places at all, but that's another story.

</details>

Jörn

-- 
There's nothing better for promoting creativity in a medium than
making an audience feel "Hmm ­ I could do better than that!"
-- Douglas Adams in a slashdot interview
