Received: from musenki.com ([192.207.126.3] helo=dinky.musenki.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1720u5-0006Je-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 03:28:37 +0100
From: Jim Thompson <jim@musenki.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15564.45011.247908.997535@zaphod.musenki.com>
Date: Sun, 28 Apr 2002 21:28:35 -0500
To: John Weston <jweston@securenet.com.au>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from /dev/mtdblock/0
In-Reply-To: <3CCC9A64.87F68E3@securenet.com.au>
References: <3CC862ED.5030007@yottayotta.com>
	<3CCC9A64.87F68E3@securenet.com.au>
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

Its a one-line fix.

    static release_t mtdblock_release(struct inode *inode, struct file *file)
    {
	    int dev;
	    struct mtdblk_dev *mtdblk;
	    DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n", inode);

	    if (inode == NULL)
		    release_return(-ENODEV);

    #if 0
	    invalidate_device(inode->i_rdev, 1);
    #endif



John Weston writes:
> G'day,
> 
> Have not got to the bottom of this yet, but having the same problem. We had
> a development board which worked fine using kernel version 2.4.3 but since
> updating to 2.4.18 we are now seeing the same problem.
> 
> Does anyone know of any required patches for this?
> 
> Thanks
> 
> John Weston
> 
> 
> 
> Mutada Shah wrote:
> 
> > Hi,
> >
> > I'm trying to boot from /dev/mtdblock/0 (root=/dev/mtdblock/0 in cmdline
> > options)
> >
> > When I boot from nfs, I can mount /dev/mtdblock/0 no problem from
> > command line & unmount etc.
> >
> > But if I pass it as the root= option, while booting it gets stuck.
> >
> > With mtd debug level to 3 I see that it tries mtdblock_open twice...
> > which it shouldnt..
> >
> > "mtdblock_open
> > ok
> > mtdblock_open
> > mtdblock_release"
> >
> > Then it hangs here for a long time.
> > What could be the cause?
> >
> > Murtada
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
"Life begins when you can spend your spare time programming
instead of watching television."  -- Cal Keegan
