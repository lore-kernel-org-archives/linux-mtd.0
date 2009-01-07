Received: from web15701.mail.cnb.yahoo.com ([202.165.102.68])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKOST-0000sJ-7f
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 02:47:50 +0000
Date: Wed, 7 Jan 2009 10:47:46 +0800 (CST)
From: peter meng <mengsanshui@yahoo.com.cn>
Subject: Re: Question relates 2K page size flash chip
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0901050852060.31730@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <696227.81552.qm@web15701.mail.cnb.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: mengsanshui@yahoo.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,Ricard=20

Thanks a lot.
Because linux deem all block is bad block  when scan flash .
I debug it that found need u-boot add OOB information into flash .


Best Regards.
Peter Meng




--- On Mon, 1/5/09, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> From: Ricard Wanderlof <ricard.wanderlof@axis.com>
> Subject: Re: Question relates 2K page size flash chip
> To: "peter meng" <mengsanshui@yahoo.com.cn>
> Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
> Date: Monday, January 5, 2009, 3:52 PM
> On Sat, 3 Jan 2009, peter meng wrote:
>=20
> > I met a problem that use K9F1G08 flash with 2K page
> size on Linux .
> > I tried jffs2 and yaffs2 file system but occurs same
> error info as following
> >=20
> > NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1
> (Samsung NAND 128MiB 1,8V 8-bit)
> > ...
> > Seems this problem is caused since 2K page size with
> flash ,so how to resolve this problem ? Whether need do
> related work within u-boot because I suppose u-boot given
> wrong data format to flash that Linux mtd does not know it ?
>=20
> Why do you think it is related to the 2k page size? This
> type of flash has been supported by mtd for a very long time
> now.
>=20
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                         =20
> ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden          =20
> www.axis.com
> Phone +46 46 272 2016                           Fax +46 46
> 13 61 30=0A=0A=0A      
