Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SFt8U-0008No-Mr
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 20:18:27 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: nanddump shows all bad blocks
Date: Thu, 5 Apr 2012 16:18:12 -0400
Message-ID: <5D308BD40154E4439D82454FE483A50206619C5A@EVS4.nam.ci.root>
In-Reply-To: <5D308BD40154E4439D82454FE483A50206619BAA@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A50206619995@EVS4.nam.ci.root>
 <4F7DEF7A.1090100@gmail.com>
 <5D308BD40154E4439D82454FE483A50206619BAA@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Bishop, Mark
> Sent: Thursday, April 05, 2012 3:39 PM
> To: linux-mtd@lists.infradead.org
> Subject: RE: nanddump shows all bad blocks
>=20
> > Sounds as if the kernel is using a different ECC method to read the
> > data
> > than what u-boot used to write it...
> >
>=20
> This has nothing to do with the internal ECC being turned on or off on
> the part?
>=20

root:/> ./fw_printenv
MTD_open
MTD_ioctl
MTD_ioctl
MTD_read
MTD_close
Warning: Bad CRC, using default environment
bootcmd=3Dbootp; setenv bootargs root=3D/dev/nfs
nfsroot=3D${serverip}:${rootpath}
ip=3D${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}::off; =
bootm
bootdelay=3D5
baudrate=3D115200

Ok, that's what I needed to wake up the brain cells.  However, I really
need 'ethaddr' and it isn't being shown. =20

Any idea why it isn't showing the entire environment?
