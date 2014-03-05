Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLBJx-0000M6-EM
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 12:53:14 +0000
Date: Wed, 5 Mar 2014 09:52:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v7 1/3] ubi: Introduce read-only block devices on top of
 UBI volumes
Message-ID: <20140305125229.GA776@arch.cereza>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394017054.6302.46.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394017054.6302.46.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 05, Artem Bityutskiy wrote:
> On Mon, 2014-02-24 at 09:39 -0300, Ezequiel Garcia wrote:
> > +/* Attach a block device to an UBI volume */
> > +#define UBI_IOCVOLATTBLK _IO(UBI_VOL_IOC_MAGIC, 7)
> 
> Ezequiel,
> 
> please, change this before it goes upstream and instead, make the ioctls
> accept a 'struct ubi_blkcreate_req' object pointer.
> 
> /**
>  * blah
>  * @padding1:  reserved for future, not used, has to be zeroed
>  */
> struct ubi_blkcreate_req {
> 	__s8 padding1[128];
> } __packed;
> 
> This will make sure we have a possibility to extend this ioctl in the
> future with something like volume creation flags etc. Otherwise, if we
> need to add a flag, we'll have to introduce a new ioctl.
> 

Sure, that sounds great. And I'll change this ioctl names:

UBI_IOCBLKCR and UBI_IOCBLKRM ?

Unless you object.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
