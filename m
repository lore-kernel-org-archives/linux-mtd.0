Received: from xproxy.gmail.com ([66.249.82.194])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHfTz-0002Nx-Jc
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 06:36:39 -0400
Received: by xproxy.gmail.com with SMTP id i26so129675wxd
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 03:36:12 -0700 (PDT)
Message-ID: <5b42f13105092003367c286a9c@mail.gmail.com>
Date: Tue, 20 Sep 2005 18:36:12 +0800
From: Sphinx King <alpharoot@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050920101524.GB2143@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <5b42f131050917055543f3d84f@mail.gmail.com>
	<20050919091917.GA21380@wohnheim.fh-wedel.de>
	<5b42f13105092000387cd0cc24@mail.gmail.com>
	<20050920101524.GB2143@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ext2 and fat32 can't handle bad block of nand flash?
Reply-To: alpharoot@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/20/05, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> On Tue, 20 September 2005 15:38:52 +0800, Sphinx King wrote:
> > Thanks for your link. I prefer FAT32 because this MTD partition will
> > be mounted to Windows PC through USB mass storage so that data can be
> > transfered between the board and PC. By reading doc it sounds like I
> > need to add translation layer between MTD and FAT32. But I could not
> > find the howto doc on FTL/NFTL in the net or archive. Could you please
> > provide any links? Besides, the NFTL is patented as described in the
> > kerel config, there will be problems if I use it in my product?
>=20
> If you have a USB key, you should already have some FTL hidden inside
> the device.  Just use the USB mass storage driver and run FAT on the
> block device.
>=20
> If that strategy doesn't work, your USB key is broken in some way.  In
> that case, you should look for a different supplier.
>=20
If there is FTL inside the device, I believe it is just the
/dev/mtdblock/4. On my board the /dev/mtdblock/4 is mounted to PC
through USB mass storage, and PC can format it as FAT32 but it is not
stable due to the bad block.

On the board this mtd block is also mounted under linux (mount -t vfat
/dev/mtdblock/4 /datadisk). Under linux it is not stable yet. So I
think I should find something than mtdblock to make FAT32 work.

My USB module is ok because the stability problem happens only when
the data was being written to the bad block of nand flash.


--=20
Sphinx
