Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dlB-0001U8-EY
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:38:20 +0100
Received: from moutng.kundenserver.de ([212.227.126.188])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 190Mfc-00047t-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 15:23:25 +0100
Received: from [212.227.126.161] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 190McZ-0002PU-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 16:20:15 +0200
Received: from [217.227.90.178] (helo=comm.esd-electronics.com)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 190McW-00040J-01
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 16:20:13 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "Thayne Harbaugh" <tharbaugh@lnxi.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Date: Tue, 1 Apr 2003 16:18:57 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
In-Reply-To: <1046724149.2666.627.camel@tubarao>
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_00C6_01C2F86A.65DDC610"
cc: linux-mtd@lists.infradead.org
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_00C6_01C2F86A.65DDC610
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi!

I am trying to use "jedec_probe.c" on our ppc based board to support two
different flash types (AMD AM29VL160xT and SSTI SST39LF160). Both are used
in 16bit mode. Since the SST flash is not really CFI compliant, I have to
use jedec_probe, right?

Two problems:
1) 16bit support for the AM29LV160 device.
The simple solution is to add the 16bit part as new device. Works here fine.

2) Support for the ST39LF160 device.
The ID-check in every block doesn't work on this device, since it's block
size is smaller that it's unlock addresses. Therefore the ID-check in every
block has to disabled for SST devices.

Please find attached a patch for these two problems (against the current cvs
version). Any comments? Could this be commited?

Best regards,
Stefan.

> -----Ursprüngliche Nachricht-----
> Von: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]Im Auftrag von Thayne
> Harbaugh
> Gesendet: Montag, 3. März 2003 21:42
> An: David Woodhouse
> Cc: linux-mtd@lists.infradead.org
> Betreff: Re: Wacky JEDEC probes
>
>
> I never committed my previous patch that improved jedec probes: I wasn't
> sure if Dave did not like it or if he just wanted more checks.  I have
> revised my previous patch and added the extra checks Dave suggested and
> I intend to commit this patch if there are not any concerns.
>
> On Thu, 2003-02-20 at 09:32, David Woodhouse wrote:
> > On Wed, 2003-02-19 at 16:26, Thayne Harbaugh wrote:
>
> <snip>
>
> > > The obvious problem is that there is no way to challenge a device and
> > > discover if it truly is in ID mode.  Because of this one must assume
> > > that sending the unlock sequence was correct and really worked.
> >
> > Some devices don't _have_ an unlock sequence though.
>
> Devices that don't have an unlock sequence are marked with
> MTD_UADDR_UNNECESSARY.
>
> >  I'm more inclined
> > to follow the route of taking the chip _out_ of ident mode and checking
> > the contents change. Bear in mind that (IIRC) we should get the correct
> > ident from offset 0 and 1 in _every_ erase block, shouldn't we?
> >
> > After finding an ident, we put the chip back in read mode and check for
> > the ident again. If it hasn't changed (i.e. the data matches the ident
> > we think we saw) then go back to ident mode and check for the ids in the
> > _next_ eraseblock instead. Or something like that ;)
>
> I added a jedec_match() function that is responsible for this now.
> jedec_match() has the following sequence:
>
> 1) checks that the ID's match
>
> 2) checks if the device has an unlock sequence and that the unlock
> addresses match
>
> 3) checks for the ID in every block
>
> 4) takes the chip out of ID mode and checks for the ID in the first
> block
>
> If and only if all of the above checks succeed then the match is
> successful.
>
> I don't feel that it is necessary to check for a change in any but the
> first block.  This is ultra conservative.  The intention is that if the
> probe does not have obvious success then it might be dangerous to
> proceed.
>
> For the case where the probe fails, but there really is a device then
> there should be a module that can be loaded that takes all the device
> parameters from the command line.  That way the user can deal with
> bizarre behavior.
>
> > > - Some devices have 8 bit and 16 bit modes and have unique unlock
> > > addresses for each.  I'm not sure which ones should be used -
> that's why
> > > these cases are labeled as "FIXME."
> >
> > The one you use depends on the mode the chip is in -- you'd probably end
> > up wanting two separate entries for these chips, or depending on which
> > mode we're in.
>
> Will add this later if the current patch is acceptable.
>
> > > - It appears that some CFI devices are in the jedec_table[] - I'm not
> > > sure if this is desirable.
> >
> > Possibly not. Who added them and when? (cvs annotate :)
>
> Have not followed through on this - yet.
>
> > > - The unlock_addrs[] array enumerates the known unlock addresses.  I
> > > have noticed that these address pairs can be x555/x2aa, x555/xaaa,
> > > x5555/x2aaa, x5555/xaaaa, x0/x0.  Some of these pairs are not
> currently
> > > listed because they are used for 8 bit mode on 16 bit
> devices.  Now that
> > > these addresses are enumerated it might be better to iterate over the
> > > list instead of keep state while shifting and or'ing.
> >
> > That's a sane idea and entirely orthogonal to the original change, I
> > suppose.
>
> Have not follewed through on this either.
>
>
> --
> Thayne Harbaugh
> Linux Networx
>

------=_NextPart_000_00C6_01C2F86A.65DDC610
Content-Type: application/octet-stream;
	name="jedec_probe.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="jedec_probe.patch"

diff -N -u -r --exclude=3DCVS --exclude=3DLOG --exclude=3D*~ =
mtd_orig/drivers/mtd/chips/jedec_probe.c =
mtd/drivers/mtd/chips/jedec_probe.c=0A=
--- mtd_orig/drivers/mtd/chips/jedec_probe.c	Tue Apr  1 13:58:21 2003=0A=
+++ mtd/drivers/mtd/chips/jedec_probe.c	Tue Apr  1 13:43:40 2003=0A=
@@ -139,6 +139,8 @@=0A=
 enum uaddr {=0A=
 	MTD_UADDR_0x0555_0x02AA,=0A=
 	MTD_UADDR_0x5555_0x2AAA,=0A=
+	MTD_UADDR_0x0AAA_0x0554,        /* for word mode */=0A=
+	MTD_UADDR_0xAAAA_0x5554,        /* for word mode */=0A=
 	MTD_UADDR_DONT_CARE,		/* Requires an arbitrary address */=0A=
 	MTD_UADDR_UNNECESSARY		/* Does not require any address */=0A=
 };=0A=
@@ -161,6 +163,16 @@=0A=
 		.addr2 =3D 0x2aaa=0A=
 	},=0A=
 =0A=
+	[MTD_UADDR_0x0AAA_0x0554] =3D {=0A=
+		.addr1 =3D 0x0AAA,=0A=
+		.addr2 =3D 0x0554=0A=
+	},=0A=
+=0A=
+	[MTD_UADDR_0xAAAA_0x5554] =3D {=0A=
+		.addr1 =3D 0xAAAA,=0A=
+		.addr2 =3D 0x5554=0A=
+	},=0A=
+=0A=
 	[MTD_UADDR_DONT_CARE] =3D {=0A=
 		.addr1 =3D 0x0000,      /* Doesn't matter which address */=0A=
 		.addr2 =3D 0x0000       /* is used - must be last entry */=0A=
@@ -206,7 +218,20 @@=0A=
 		mfr_id: MANUFACTURER_AMD,=0A=
 		dev_id: AM29LV160DT,=0A=
 		name: "AMD AM29LV160DT",=0A=
-		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */=0A=
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* bytes mode */=0A=
+		DevSize: SIZE_2MiB,=0A=
+		CmdSet:	P_ID_AMD_STD,=0A=
+		NumEraseRegions: 4,=0A=
+		regions: {ERASEINFO(0x10000,31),=0A=
+			  ERASEINFO(0x08000,1),=0A=
+			  ERASEINFO(0x02000,2),=0A=
+			  ERASEINFO(0x04000,1)=0A=
+		}=0A=
+	}, {=0A=
+		mfr_id: MANUFACTURER_AMD,=0A=
+		dev_id: AM29LV160DT,=0A=
+		name: "AMD AM29LV160DT",=0A=
+		uaddr: MTD_UADDR_0x0AAA_0x0554, /* word mode */=0A=
 		DevSize: SIZE_2MiB,=0A=
 		CmdSet:	P_ID_AMD_STD,=0A=
 		NumEraseRegions: 4,=0A=
@@ -219,7 +244,20 @@=0A=
 		mfr_id: MANUFACTURER_AMD,=0A=
 		dev_id: AM29LV160DB,=0A=
 		name: "AMD AM29LV160DB",=0A=
-		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */=0A=
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* byte mode */=0A=
+		DevSize: SIZE_2MiB,=0A=
+		CmdSet:	P_ID_AMD_STD,=0A=
+		NumEraseRegions: 4,=0A=
+		regions: {ERASEINFO(0x04000,1),=0A=
+			  ERASEINFO(0x02000,2),=0A=
+			  ERASEINFO(0x08000,1),=0A=
+			  ERASEINFO(0x10000,31)=0A=
+		}=0A=
+	}, {=0A=
+		mfr_id: MANUFACTURER_AMD,=0A=
+		dev_id: AM29LV160DB,=0A=
+		name: "AMD AM29LV160DB",=0A=
+		uaddr: MTD_UADDR_0x0AAA_0x0554, /* word mode */=0A=
 		DevSize: SIZE_2MiB,=0A=
 		CmdSet:	P_ID_AMD_STD,=0A=
 		NumEraseRegions: 4,=0A=
@@ -1051,6 +1089,26 @@=0A=
 		regions:         {=0A=
 			ERASEINFO( 0x01000, 256 )=0A=
 		}=0A=
+	}, {=0A=
+		mfr_id: MANUFACTURER_SST,=0A=
+		dev_id: SST39LF800,=0A=
+		name: "SSTI SST39LF800",=0A=
+		uaddr: MTD_UADDR_0xAAAA_0x5554, /* word mode only */=0A=
+		DevSize: SIZE_1MiB,=0A=
+		CmdSet:	P_ID_AMD_STD,=0A=
+		NumEraseRegions: 1,=0A=
+		regions: {ERASEINFO(0x1000,256)=0A=
+		}=0A=
+	}, {=0A=
+		mfr_id: MANUFACTURER_SST,=0A=
+		dev_id: SST39LF160,=0A=
+		name: "SSTI SST39LF160",=0A=
+		uaddr: MTD_UADDR_0xAAAA_0x5554, /* word mode only */=0A=
+		DevSize: SIZE_2MiB,=0A=
+		CmdSet:	P_ID_AMD_STD,=0A=
+		NumEraseRegions: 1,=0A=
+		regions: {ERASEINFO(0x1000,512)=0A=
+		}=0A=
 	}=0A=
 };=0A=
 =0A=
@@ -1171,9 +1229,25 @@=0A=
 	       "MTD %s(): check ID's in every block: %dx%d\n",=0A=
 	       __func__, blk_size, blocks );=0A=
 =0A=
+	/*=0A=
+	 * Don't check for ID in every block on SST devices.=0A=
+	 */=0A=
+	if (cfi->mfr =3D=3D MANUFACTURER_SST)=0A=
+		blocks =3D 1;=0A=
+=0A=
 	for ( blk =3D 0; blk < blocks; blk++ ) {=0A=
 		mfr =3D cfi_read( map, blk * blk_size );=0A=
-		id  =3D cfi_read( map, blk * blk_size + 1 );=0A=
+		switch (cfi->device_type) {=0A=
+		case CFI_DEVICETYPE_X8:=0A=
+			id  =3D cfi_read( map, blk * blk_size + 1 );=0A=
+			break;=0A=
+		case CFI_DEVICETYPE_X16:=0A=
+			id  =3D cfi_read( map, blk * blk_size + 2 );=0A=
+			break;=0A=
+		case CFI_DEVICETYPE_X32:=0A=
+			id  =3D cfi_read( map, blk * blk_size + 4 );=0A=
+			break;=0A=
+		}=0A=
 =0A=
 		if ( cfi->mfr !=3D mfr || cfi->id !=3D id ) {=0A=
 			DEBUG( MTD_DEBUG_LEVEL3,=0A=

------=_NextPart_000_00C6_01C2F86A.65DDC610--
