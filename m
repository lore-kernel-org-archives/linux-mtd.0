Received: from web20304.mail.yahoo.com ([216.136.226.85])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VEnl-0000b8-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 16:38:37 +0000
Message-ID: <20020128164940.38134.qmail@web20304.mail.yahoo.com>
Date: Mon, 28 Jan 2002 16:49:40 +0000 (GMT)
From: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Subject: Re: JFFS XConfig 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <16227.1011718346@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

 --- David Woodhouse <dwmw2@infradead.org> wrote: > 
> monitoreurope@yahoo.co.uk said:
> >  We have downloaded the source of 2.4.12 and are
> using XConfig to set
> > compile parameters. We intend a system with a 16M
> compact flash IDE
> > device formatted as JFFS2. However when it comes
> to JFFS2 the option
> > is greyed out, JFFS is however available for
> selection, any thoughts? 
> 
> JFFS and JFFS2 will not be available unless you have
> selected CONFIG_MTD.
> 
> As you don't have any flash devices on your system
> and you want to use 
> JFFS2 on a hard drive, you need to select the
> 'blkmtd' driver and configure 
> it to use your CF drive as backing store for the
> faked MTD device.
> 
> --
> dwmw2

Thanks for the advice David, however it appears still
not to be available with CONFID_MTD enabled. However
JFFS is available!

Any other ideas?

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
