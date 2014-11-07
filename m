Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xml0W-0007ST-B5
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 14:59:25 +0000
Message-ID: <1415372340.22887.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 07 Nov 2014 16:59:00 +0200
In-Reply-To: <20141105202303.GN23619@ld-irv-0074>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Rodrigo Freire <rfreire@redhat.com>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-11-05 at 12:23 -0800, Brian Norris wrote:
> On Wed, Sep 17, 2014 at 04:28:03PM -0400, Rodrigo Freire wrote:
> > From: Felix Fietkau <nbd@openwrt.org>
> > 
> > mtd: block2mtd: Ensure that block2mtd is presented in a timely fashion
> > 
> > Currently, a block MTD device is not presented to the system on time, in
> > order to start mounting the filesystems. This patch ensures that block2mtd
> > is presented at the right time, so filesystems can be mounted on boot time.
> > This issue was seen on BCM2835 (Raspberry Pi) systems when mounting JFFS2
> > block2mtd filesystems.
> 
> This still seems like a bad idea (using a block device + block2mtd +
> JFFS2). Why are you doing this? See comments here:
> 
>   http://www.linux-mtd.infradead.org/faq/jffs2.html#L_hdd_jffs2

At old days it was impossible to mount character devices, only block
devices. So people ware using mtdblock to mount jffs2. This is just a
work-around.

I did not look at this code for long time, and may have forgotten
something, but I believe you do not need mtdblock anymore for this. You
just mount the mtd device.

This driver should not be used for this.

The only usage of this driver is emulating a block device on top of NOR
flash, and in most cases, only for debugging / research purposes. This
is because (a) this driver does not handle bad blocks (and hence,
NAND-incompatible) and (b) it does read-erase-write when you modify a
block, so it is extremely slow and does not handle power cuts at all.

Therefore,

Nack for this patch so far.

Artem.
