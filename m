Received: from e4.ny.us.ibm.com ([32.97.182.104])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CES5I-0005bI-8s
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 08:36:57 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Artem Bityuckiy <dedekind@oktetlabs.ru>
In-Reply-To: <4161379C.3070109@oktetlabs.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<4161379C.3070109@oktetlabs.ru>
Content-Type: text/plain
Message-Id: <1096893405.22034.9.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 07:36:45 -0500
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 06:44, Artem Bityuckiy wrote:
> > 
> It should also be noted, that the checkpoints support will be added 
> under the "#ifdef CONFIG_JFFS2_FS_NAND" directive since it only makes 
> sence for the NAND flash devices...
> 

Yes and no.  It makes sense for any flash device that you can't write to
the same page multiple times without an erase in between.  NAND is
certainly the largest group of such devices.  There are others that have
this behavior as well.  See cfi_cmdset_0020.c.

Although, JFFS2 doesn't support those chips right now, so I guess I am
just rambling :).

josh
