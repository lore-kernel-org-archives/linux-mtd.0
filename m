Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0kZx-0003Jg-LH
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 13:04:14 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Janot <f.janot@ateme.fr>
In-Reply-To: <4210E6C3.9030208@ateme.fr>
References: <4210DB19.9000808@ateme.fr> <4210DEDB.DD35E2DE@st.com>
	<4210E6C3.9030208@ateme.fr>
Content-Type: text/plain; charset=utf-8
Date: Mon, 14 Feb 2005 19:04:09 +0100
Message-Id: <1108404250.16612.327.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 18:58 +0100, Frédéric Janot wrote:
> >JFFS2 on NAND flash uses a page buffer. It is flushed to the flash when
> >it is full, or when you do fsync, sync or umount.
> >
> Does that mean that I have to call fsync each time after fclose a file ?
> Even if I do not edit some files, I get this kind of error. Does that 
> mean something (jffs2 itself or other) write some data to the flash all 
> the time ?

No, jffs2 does not write data just for fun. There is some application,
script, daemon writing/modifying file(s).

tglx
