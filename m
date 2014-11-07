Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmg6K-0003dr-Pt
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 09:45:05 +0000
Message-ID: <1415353480.958.301.camel@sauron.fi.intel.com>
Subject: Re: [RESEND PATCH V2] mtd: block2mtd: Present block2mtd timely on
 boot time
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Rodrigo Freire <rfreire@redhat.com>
Date: Fri, 07 Nov 2014 11:44:40 +0200
In-Reply-To: <2124950018.4236135.1414848795831.JavaMail.zimbra@redhat.com>
References: <2124950018.4236135.1414848795831.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-11-01 at 09:33 -0400, Rodrigo Freire wrote:
> From: Felix Fietkau <nbd@openwrt.org> 
> 
> mtd: block2mtd: Ensure that block2mtd is presented timely on boot time
> 
> Currently, a block MTD device is not presented to the system on time, in 
> order to start mounting the filesystems. This patch ensures that block2mtd 
> is presented at the right time, so filesystems can be mounted on boot time. 
> This issue is seen on BCM2835 (Raspberry Pi) systems when mounting JFFS2 
> over block2mtd devices as the root filesystem.
> This patchset also adds a MTD device name and a timeout option to the driver. 
> Original patchset: 
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/440-block2mtd_init.patch?rev=40444 
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.12/441-block2mtd_probe.patch?rev=40444 

I  think you can mount jffs2 using /dev/mtdX, you do not need the block
driver.
