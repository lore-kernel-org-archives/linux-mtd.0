Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D0keA-0003US-Lo
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 13:08:37 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j1EI8Vhf027082
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 13:08:31 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j1EI8Va5251532
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 13:08:31 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j1EI8VEE016472
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2005 13:08:31 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Janot <f.janot@ateme.fr>
In-Reply-To: <4210E6C3.9030208@ateme.fr>
References: <4210DB19.9000808@ateme.fr> <4210DEDB.DD35E2DE@st.com>
	<4210E6C3.9030208@ateme.fr>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 14 Feb 2005 12:08:01 -0600
Message-Id: <1108404481.7790.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
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

On Mon, 2005-02-14 at 18:58 +0100, Frédéric Janot wrote:
> >
> Does that mean that I have to call fsync each time after fclose a file ?
> Even if I do not edit some files, I get this kind of error. Does that 
> mean something (jffs2 itself or other) write some data to the flash all 
> the time ?

Sorta.  See below.

> 
> >Some data may remain in the page buffer and is never written
> >to the Flash.
> >  
> >
> So I really loose some data :(

Maybe not.  It could be a GC node that was cut short.  In that case, you
shouldn't loose any data since the original node should still be in
place.

> It is an embedded board without power supervisor. I cannot detect when 
> the customer power down the board :(

If you are worried about data loss, then fsync/sync is probably what you
should do.

josh
