Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rMkZ-0002WQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 18:02:32 +0100
Date: Wed, 10 Oct 2001 19:16:52 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Eraseblock size in jffs2 ? 
In-Reply-To: <22822.1002731498@redhat.com>
Message-ID: <Pine.LNX.4.21.0110101848230.18912-100000@lxserver.deltes.cz>
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

Hi

If jffs2 doesn't work should I use the same procedure with jffs(v1)?
I'm very confused with it because when I use eraseall on the mtd0 device
than I erase  MBR and so  too ?
I won't be able to boot from this, will I ?

What filesystem is probably the best for DoC now ?
I can try jffs2 on a DoC when I will know what .... Mainly I can test it
;-)
But I'm finding some (pre)stable solution or me now ;o).

Thanks so much

Martin

PS. Sorry for my bad English ;-(




On Wed, 10 Oct 2001, David Woodhouse wrote:

> 
> 
> > 2. Must I use erase command when I create jffs2 on the DoC ?
> 
> You need to erase the device first. Use the 'eraseall' utility:
> 	eraseall /dev/mtd0
> Then you can use dd to put the image on the device.
> 
> Unfortunately, JFFS2 doesn't yet work on the DiskOnChip, because it uses 
> NAND flash. JFFS v1 should probably work, or you can fix up JFFS2 to work 
> too.
> 
> --
> dwmw2
> 
