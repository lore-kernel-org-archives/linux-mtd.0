Received: from lon-del-02.spheriq.net ([195.46.50.98])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D0jy3-0002gg-IB
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 12:25:07 -0500
Received: from lon-inc-06.spheriq.net ([195.46.50.70])
	by lon-del-02.spheriq.net with ESMTP id j1EHOwR3003851
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 17:24:58 GMT
Received: from lon-out-03.spheriq.net (lon-out-03.spheriq.net [195.46.50.131])
	by lon-inc-06.spheriq.net with ESMTP id j1EHOupC010077
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 17:24:56 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id j1EHOt4V024408
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 17:24:56 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4210DEDB.DD35E2DE@st.com>
Date: Mon, 14 Feb 2005 18:24:43 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Janot <f.janot@ateme.fr>
References: <4210DB19.9000808@ateme.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frédéric Janot wrote:
> 
> Hi,
> 
> I have a board with samsung K9F5608UOC nand flash and mpc5200 ppc processor.

JFFS2 on NAND flash uses a page buffer. It is flushed to the flash when
it is full, or when you do fsync, sync or umount.

> when I reboot the board or when I remove the power "violently"

Some data may remain in the page buffer and is never written
to the Flash.

> jffs2_get_inode_nodes(): Data CRC failed on node at 0x00cc0f90: Read
> 0x6e17981a,  calculated 0x4614a389

Well obviously a node was partly written to flash and the end of the
node remained in the cache and was never written. This means you
lost some data.

> /And I get one more message each time I reboot the board. But the
> filesystem doesn't seem corrupted.

It is a warning only. The remainder of the file system will probably
still work. Only the last operation(s) before reboot are lost.

> If I umount / before rebooting, I don't have one more error message at
> the next reboot.

This is correct procedure if you don't want to lose any data.

> Do you have any idea about where the problem could come from ?

There is no problem. This is standard JFFS2 processing. Nodes with
wrong CRCs (partly written for instance) are ignored and not taken 
in account when building the FS tree and files.

Estelle
