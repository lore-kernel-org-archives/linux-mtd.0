Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VFgM-0000fl-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 17:35:02 +0000
Date: Mon, 28 Jan 2002 18:45:52 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Mackay <monitoreurope@yahoo.co.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: JFFS XConfig
Message-ID: <20020128184552.A10755@wohnheim.fh-wedel.de>
References: <16227.1011718346@redhat.com> <20020128164940.38134.qmail@web20304.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020128164940.38134.qmail@web20304.mail.yahoo.com>; from monitoreurope@yahoo.co.uk on Mon, Jan 28, 2002 at 04:49:40PM +0000
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

Hi!

> > JFFS and JFFS2 will not be available unless you have
> > selected CONFIG_MTD.
> 
> Thanks for the advice David, however it appears still
> not to be available with CONFID_MTD enabled. However
> JFFS is available!
> 
> Any other ideas?

See linux/fs/Config.in. It should contain something like this:
dep_tristate 'Journalling Flash File System v2 (JFFS2) support' CONFIG_JFFS2_FS $CONFIG_MTD

It translates pretty much to David's previous answer. If you see this
and make xconfig still doesn't work but make menuconfig does, this is
a bug. If both don't, something looks seriously wrong. Make sure you
didn't cause it (stock kernel, no patches,...) and send some feedback.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
