Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMJIO-0001to-9e
	for linux-mtd@lists.infradead.org; Thu, 02 Jul 2009 10:13:43 +0000
Subject: Re: about ubiformat mtdblock
From: tommy <jiujin.hong@mid-fun.com>
To: Ivan Chan <ivanming@gmail.com>
In-Reply-To: <d16af8a00907020255r60112844qbb7f020afd9a1ac0@mail.gmail.com>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
	<1246241677.7834.5.camel@tommy-desktop>
	<1246373466.20721.12.camel@localhost.localdomain>
	<1246527596.2944.1.camel@tommy-desktop>
	<d16af8a00907020255r60112844qbb7f020afd9a1ac0@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2009 18:13:30 +0800
Message-Id: <1246529610.2944.5.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thanks,i know ubifs !

When i inser a sd card ,ubifs say error ,i can't undertand!
UBIFS error (pid 1809): ubifs_get_sb: cannot open "/dev/mmcblk0", error

can you explain ?
-
On 四, 2009-07-02 at 17:55 +0800, Ivan Chan wrote:
> Hi,
> 
> The ubifs/ubi should work on NAND device but not a SD card.
> SD card should use vfat.
> 
> Regards,
> Ivan
> 
> On Thu, Jul 2, 2009 at 5:39 PM, tommy<jiujin.hong@mid-fun.com> wrote:
> > hi,dear sir !
> >
> > i met a new question in UBIFS rootfs system !
> >
> > when i inser a SD card in my board ,system say error :
> > UBIFS error (pid 1809): ubifs_get_sb: cannot open "/dev/mmcblk0", error
> > -22
> >
> > what cause this error ?
> >
> > On 二, 2009-06-30 at 17:51 +0300, Artem Bityutskiy wrote:
> >> On Mon, 2009-06-29 at 10:14 +0800, tommy wrote:
> >> > HI,Dear sir !
> >> >
> >> > i have a question!
> >> >
> >> > I have patched your 2.6.24-ubifs-git on my ARM11 platform !
> >> >
> >> > it have succeed run and stable !
> >> >
> >> > My rootfs have a /etc/fstab file !
> >> >
> >> > # stock fstab - you probably want to override this with a machine
> >> > specific one
> >> >
> >> > rootfs               /                    auto       defaults
> >> > 1  1
> >> > proc                 /proc                proc       defaults
> >> > 0  0
> >> > devpts               /dev/pts             devpts     mode=0620,gid=5
> >> > 0  0
> >> > #usbdevfs             /proc/bus/usb        usbdevfs   noauto
> >> > 0  0
> >> > tmpfs                /var                 tmpfs      defaults
> >> > 0  0
> >> > tmpfs                /mnt/ram           tmpfs      defaults
> >> > 0  0
> >> >
> >> > if  i enable "rootfs   /  auto  defaults 1 1 ",when kernel
> >> > booting ,ubifs driver will say "UBIFS error (pid 628): ubifs_get_sb:
> >> > cannot open "rootfs", error -22"!
> >> >
> >> > if i disable "#rootfs / auto deafults 1 1 ",when kernel booting ,ubifs
> >> > driver never say error ,
> >> > can you explain it ?
> >> >
> >> > because my old ubifs patched driver never say any error even if  it is
> >> > enable  !
> >>
> >> Can you mount it when you use the mount utility directly?
> >>
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> 
