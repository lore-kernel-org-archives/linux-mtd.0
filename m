Date: Tue, 3 Apr 2018 10:43:54 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: xiaolei li <xiaolei.li@mediatek.com>
Cc: <richard@nod.at>, <linux-mediatek@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [PATCH] mtd: Add sysfs attribute for mtd OOB available size
Message-ID: <20180403104354.03895246@bbrezillon>
In-Reply-To: <1522723618.3504.7.camel@mhfsdcap03>
References: <1522657210-56833-1-git-send-email-xiaolei.li@mediatek.com>
 <1522657210-56833-2-git-send-email-xiaolei.li@mediatek.com>
 <20180402141505.33051c14@bbrezillon>
 <1522723618.3504.7.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 Apr 2018 10:46:58 +0800
xiaolei li <xiaolei.li@mediatek.com> wrote:

> Hello Boris,
> 
> On Mon, 2018-04-02 at 14:15 +0200, Boris Brezillon wrote:
> > Hi Xiaolei,
> > 
> > On Mon, 2 Apr 2018 16:20:10 +0800
> > Xiaolei Li <xiaolei.li@mediatek.com> wrote:
> >   
> > > Expose mtd OOB available size by sysfs file. Then users can get available
> > > OOB size by accessing /sys/class/mtd/mtdX/oobavail.  
> > 
> > May I ask why you need to expose that? I'm not against exposing new
> > things through sysfs, but since this is part of the ABI, I'd like to be
> > sure we actually need it.
> >   
> That is user-space can write OOB data through ioctl MEMWRITE now.
> If OOB operation mode is MTD_OPS_AUTO_OOB, user should know how many
> OOB available bytes it can use. But I didn't find a way to get it. (If
> there is already a method, please kindly let me know, thanks.)

Nope. We have the ECCGETLAYOUT ioctl, but it's not reliable because of
the MTD_MAX_OOBFREE_ENTRIES limitation.

> 
> One problem I know is to do Jffs2 type flash erase using MTD user-space
> tool flash_erase. flash_erase tool will program "cleanmarker" into OOB
> free area, but it can not get OOB available size.

That's a good reason to expose this property indeed. Do you plan to fix
mtd-utils to use the sysfs value when it's available? Also, do we need
to expose the ECC/free layout as done with the
ECCGETLAYOUT/MEMGETOOBSEL ioctls?
