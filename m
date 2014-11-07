Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmpnE-0006w6-9r
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 20:06:01 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so4193660pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2014 12:05:38 -0800 (PST)
Date: Fri, 7 Nov 2014 12:05:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RESEND PATCH V2] mtd: block2mtd: Present block2mtd timely on
 boot time
Message-ID: <20141107200528.GA24946@ld-irv-0074>
References: <2124950018.4236135.1414848795831.JavaMail.zimbra@redhat.com>
 <1415353480.958.301.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415353480.958.301.camel@sauron.fi.intel.com>
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
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

On Fri, Nov 07, 2014 at 11:44:40AM +0200, Artem Bityutskiy wrote:
> On Sat, 2014-11-01 at 09:33 -0400, Rodrigo Freire wrote:
> > From: Felix Fietkau <nbd@openwrt.org> 
> > 
> > mtd: block2mtd: Ensure that block2mtd is presented timely on boot time
> > 
> > Currently, a block MTD device is not presented to the system on time, in 
> > order to start mounting the filesystems. This patch ensures that block2mtd 
> > is presented at the right time, so filesystems can be mounted on boot time. 
> > This issue is seen on BCM2835 (Raspberry Pi) systems when mounting JFFS2 
> > over block2mtd devices as the root filesystem.
> > This patchset also adds a MTD device name and a timeout option to the driver. 
> > Original patchset: 
> > https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/440-block2mtd_init.patch?rev=40444 
> > https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/441-block2mtd_probe.patch?rev=40444 
> 
> I  think you can mount jffs2 using /dev/mtdX, you do not need the block
> driver.

I realize you acknowledged your misunderstanding here, but for
posterity -- this point is addressed in the FAQ:

http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

Last I checked, the statement about busybox is still true. I think the
rootfs comment may be stale; I think the rootfstype= parameter can help
you.

Brian
