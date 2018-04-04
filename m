Date: Wed, 4 Apr 2018 22:05:41 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: xiaolei li <xiaolei.li@mediatek.com>
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Add sysfs attribute for mtd OOB available size
Message-ID: <20180404220541.27bed79a@bbrezillon>
In-Reply-To: <1522753263.3673.16.camel@mhfsdcap03>
References: <1522657210-56833-1-git-send-email-xiaolei.li@mediatek.com>
 <1522657210-56833-2-git-send-email-xiaolei.li@mediatek.com>
 <20180402141505.33051c14@bbrezillon>
 <1522723618.3504.7.camel@mhfsdcap03>
 <20180403104354.03895246@bbrezillon>
 <1522748411.3673.12.camel@mhfsdcap03>
 <20180403121406.3f14a4b7@bbrezillon>
 <1522753263.3673.16.camel@mhfsdcap03>
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

On Tue, 3 Apr 2018 19:01:03 +0800
xiaolei li <xiaolei.li@mediatek.com> wrote:

> On Tue, 2018-04-03 at 12:14 +0200, Boris Brezillon wrote:
> > On Tue, 3 Apr 2018 17:40:11 +0800
> > xiaolei li <xiaolei.li@mediatek.com> wrote:
> >   
> > > On Tue, 2018-04-03 at 10:43 +0200, Boris Brezillon wrote:  
> > > > On Tue, 3 Apr 2018 10:46:58 +0800
> > > > xiaolei li <xiaolei.li@mediatek.com> wrote:
> > > >     
> > > > > Hello Boris,
> > > > > 
> > > > > On Mon, 2018-04-02 at 14:15 +0200, Boris Brezillon wrote:    
> > > > > > Hi Xiaolei,
> > > > > > 
> > > > > > On Mon, 2 Apr 2018 16:20:10 +0800
> > > > > > Xiaolei Li <xiaolei.li@mediatek.com> wrote:
> > > > > >       
> > > > > > > Expose mtd OOB available size by sysfs file. Then users can get available
> > > > > > > OOB size by accessing /sys/class/mtd/mtdX/oobavail.      
> > > > > > 
> > > > > > May I ask why you need to expose that? I'm not against exposing new
> > > > > > things through sysfs, but since this is part of the ABI, I'd like to be
> > > > > > sure we actually need it.
> > > > > >       
> > > > > That is user-space can write OOB data through ioctl MEMWRITE now.
> > > > > If OOB operation mode is MTD_OPS_AUTO_OOB, user should know how many
> > > > > OOB available bytes it can use. But I didn't find a way to get it. (If
> > > > > there is already a method, please kindly let me know, thanks.)    
> > > > 
> > > > Nope. We have the ECCGETLAYOUT ioctl, but it's not reliable because of
> > > > the MTD_MAX_OOBFREE_ENTRIES limitation.
> > > >     
> > > > > 
> > > > > One problem I know is to do Jffs2 type flash erase using MTD user-space
> > > > > tool flash_erase. flash_erase tool will program "cleanmarker" into OOB
> > > > > free area, but it can not get OOB available size.    
> > > > 
> > > > That's a good reason to expose this property indeed. Do you plan to fix
> > > > mtd-utils to use the sysfs value when it's available? Also, do we need
> > > > to expose the ECC/free layout as done with the
> > > > ECCGETLAYOUT/MEMGETOOBSEL ioctls?
> > > >     
> > > Yes. I plan to fix mtd-utils problem if this change is accepted.
> > > 
> > > struct nand_oobinfo and struct nand_ecclayout_user in mtd-abi.h are
> > > obsoleted, and user can not get oob layout by ioctl method now.
> > > sysfs seems a method to fetch oob layout. But I don't know which
> > > user-space case will use oob layout now. Maybe expose them in the future
> > > if they are really needed?  
> > 
> > If the layout is not needed yet, let's not expose it. BTW, are you
> > really using JFFS2 on modern NAND chips? Sounds like a bad idea to me.  
> Yes. I tested Micron SLC NAND with 4K page size and 224 OOB size these
> days. Jffs2 runs good on this NAND.

Yes, it should work, but I'm not sure JFFS2 scales well on >128MB
NANDs, and people tend to use UBI on such devices nowadays (this + the
fact that JFFS2 is not actively maintained).

Anyway, I guess your change is acceptable, I'd just like to see
patches for mtd-utils using this sysfs entry now ;-).

Regards,

Boris
