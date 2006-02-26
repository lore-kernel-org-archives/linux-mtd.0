Received: from nproxy.gmail.com ([64.233.182.197])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FDKza-0006Vx-6Q
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2006 07:27:16 -0500
Received: by nproxy.gmail.com with SMTP id l37so513160nfc
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Feb 2006 04:27:09 -0800 (PST)
Message-ID: <d0cf8c90602260427m10fa62c4td5ca25d4102fdf33@mail.gmail.com>
Date: Sun, 26 Feb 2006 20:27:09 +0800
From: "Kein Yuan" <kein.yuan@gmail.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
In-Reply-To: <44017402.6030405@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <d0cf8c90602240714g69b0bcf5y47dba43e25fb139c@mail.gmail.com>
	<44017402.6030405@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Strange problem with JFFS2/MTD on Linux 2.6.9 ith Intel J3 Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using  mkfs.jffs2 -r rootfs -e0x40000 -p0x1000000 -o demo.jffs2.
Also I tried erase blobk size as 0x20000 and 0x10000 and all are failed to =
boot.


On 2/26/06, Alexey, Korolev <alexey.korolev@intel.com> wrote:
> Kein Yuan wrote:
>
> > I am working on a PXA270 based paltform with Intel J3 Flash on Linux
> > 2.6.9.  I am sure that jffs2 image was written into the correct place
> > and verified by md5chk command in blob, but somehow kernel can detect
> > flash, can dump out the context correctly but failed to mount  the
> > flash partition as my root filesystem.  Can anybody here give me some
> > hints?    The boot log was pasted as below:
> >
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00037ef4:
> > 0x9f54 instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003f070:
> > 0xf960 instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
> > 0x085c instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
> > 0x1860 instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000d2bb4:
> > 0x0001 instead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0012a370:
> > 0x006e instead
> >
> It possible that you specified erase block size improperly when you
> created image of JFFS2 file system. Size of erase block can be specified
> through -e parameter of mkfs.jffs2 utility.
> Erase block size can be obtained using blob. (On attmempt to write
> something blob should display size of erase block)
>
> Thanks,
> Alexey
>
>
