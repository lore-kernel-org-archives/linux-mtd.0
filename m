Received: from [218.109.187.75] (helo=samfei.8800.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19n61s-0001xr-Gx
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 01:31:48 +0100
From: "Sam Fei" <jffs@samfei.8800.org>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Date: Thu, 14 Aug 2003 8:30:55 +0800
Message-Id: <E19n61s-0001xr-Gx@pentafluge.infradead.org>
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Subject: Can I use whole flash chip in one mtd partition with jffs2
	filesystem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd=A3=AC=C4=FA=BA=C3=A3=A1

=09I have two flash chips, I want use second chip to store my=
 application data, 
make it jffs2 filesytem. The chip has 2M bytes and the sectors=
 is:
 16K(1) 8K(2) 32K(1) 64K (31)
I made mtd partion: 

static struct mtd_partition my_partitions[] =3D {
       {
               name: "user (2048K)",
               size: 0x200000,
               offset: 0x0
       }
}; 

When i erase /dev/mtd0, found :
the numEraseRegions is 0 

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
the debug information: 

MTD_open minor=3D0
MTD_open devnum=3D0
MTD_open numeraseregions=3D0
Erase Total 1 Units
MTD_ioctl cmd=3D80044d07
numeraseregions=3D0
MTD_ioctl cmd=3D801e4d01
PerformTing Flash Erase of length 65536 at offset 0x0
done
MTD_close
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 

The /proc/mtd information is: 

/var> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00200000 00010000 "user (2048K)" 


Is this correct?   Why the NumEraseRegions is zero?   I think it=
 is 4.

The eraseall information: 

/var> eraseall /dev/mtd0
MTD_open minor=3D0
MTD_open devnum=3D0
MTD_open numeraseregions=3D0
MTD_ioctl cmd=3D801e4d01
Erasing 64 Kibyte @ 0 --M  0 % complete.TD_ioctl cmd=3D40084d02
Erasing 64 Kibyte @ 1000M0 --  3 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 2000M0 --  6 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 3000M0 --  9 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 4000M0 -- 12 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 5000M0 -- 15 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 6000M0 -- 18 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 7000M0 -- 21 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 8000M0 -- 25 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 9000M0 -- 28 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ a000M0 -- 31 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ b000M0 -- 34 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ c000M0 -- 37 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ d000M0 -- 40 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ e000M0 -- 43 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ f000M0 -- 46 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1000M00 -- 50 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1100M00 -- 53 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1200M00 -- 56 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1300M00 -- 59 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1400M00 -- 62 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1500M00 -- 65 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1600M00 -- 68 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1700M00 -- 71 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1800M00 -- 75 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1900M00 -- 78 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1a00M00 -- 81 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1b00M00 -- 84 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1c00M00 -- 87 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1d00M00 -- 90 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1e00M00 -- 93 % complete.TD_ioctl=
 cmd=3D40084d02
Erasing 64 Kibyte @ 1f00M00 -- 96 % complete.TD_ioctl=
 cmd=3D40084d02
Erased 2048 Kibyte @ 0 -M- 100% complete.
TD_close
/var> 

df information:
/dev/mtdblock0            2048       324      1724  16% /var/data=
 


=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=D6=C2
=C0=F1=A3=A1
 =09=09=09=09
=B7=D1=BA=A3=C1=D6
=D5=E3=BD=AD=D5=E3=B4=F3=CD=F8=D0=C2=BF=C6=BC=BC=B9=C9=B7=DD=D3=D0=CF=DE=B9=AB=CB=BE
=B5=D8=D6=B7=A3=BA=D5=E3=BD=AD=BA=BC=D6=DD=CA=EF=B9=E2=C2=B715=BA=C5=D5=E3=BD=AD=CA=C0=BD=E7=C3=B3=D2=D7=D6=D0=D0=C4=D0=B4=D7=D6=C2=A5C=D7=F912=B2=E3
=B5=E7=BB=B0=A3=BA88270028 EXT 2222
=CA=D6=BB=FA=A3=BA13957130355
E-mail=A3=BAfeihailin@insigma.com.cn

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12003-08-14
