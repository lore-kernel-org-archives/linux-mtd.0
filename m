From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 03 Mar 2003 13:42:29 -0700
Subject: Wacky JEDEC probes
In-Reply-To: <1045758752.27290.9.camel@passion.cambridge.redhat.com>
References: <1045671999.2672.28.camel@tubarao>
 <1045758752.27290.9.camel@passion.cambridge.redhat.com>
Message-ID: <1046724149.2666.627.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-5rgJ2igtPlOXDJ21tYiT
Content-Type: multipart/mixed; boundary="=-meGBAhbFME3LfCdvNDOx"


--=-meGBAhbFME3LfCdvNDOx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I never committed my previous patch that improved jedec probes: I wasn't
sure if Dave did not like it or if he just wanted more checks.  I have
revised my previous patch and added the extra checks Dave suggested and
I intend to commit this patch if there are not any concerns.

On Thu, 2003-02-20 at 09:32, David Woodhouse wrote:
> On Wed, 2003-02-19 at 16:26, Thayne Harbaugh wrote:

<snip>

> > The obvious problem is that there is no way to challenge a device and
> > discover if it truly is in ID mode.  Because of this one must assume
> > that sending the unlock sequence was correct and really worked.
>=20
> Some devices don't _have_ an unlock sequence though.

Devices that don't have an unlock sequence are marked with
MTD_UADDR_UNNECESSARY.

>  I'm more inclined
> to follow the route of taking the chip _out_ of ident mode and checking
> the contents change. Bear in mind that (IIRC) we should get the correct
> ident from offset 0 and 1 in _every_ erase block, shouldn't we?
>=20
> After finding an ident, we put the chip back in read mode and check for
> the ident again. If it hasn't changed (i.e. the data matches the ident
> we think we saw) then go back to ident mode and check for the ids in the
> _next_ eraseblock instead. Or something like that ;)

I added a jedec_match() function that is responsible for this now.=20
jedec_match() has the following sequence:

1) checks that the ID's match

2) checks if the device has an unlock sequence and that the unlock
addresses match

3) checks for the ID in every block

4) takes the chip out of ID mode and checks for the ID in the first
block

If and only if all of the above checks succeed then the match is
successful.

I don't feel that it is necessary to check for a change in any but the
first block.  This is ultra conservative.  The intention is that if the
probe does not have obvious success then it might be dangerous to
proceed.

For the case where the probe fails, but there really is a device then
there should be a module that can be loaded that takes all the device
parameters from the command line.  That way the user can deal with
bizarre behavior.

> > - Some devices have 8 bit and 16 bit modes and have unique unlock
> > addresses for each.  I'm not sure which ones should be used - that's wh=
y
> > these cases are labeled as "FIXME."
>=20
> The one you use depends on the mode the chip is in -- you'd probably end
> up wanting two separate entries for these chips, or depending on which
> mode we're in.

Will add this later if the current patch is acceptable.

> > - It appears that some CFI devices are in the jedec_table[] - I'm not
> > sure if this is desirable.
>=20
> Possibly not. Who added them and when? (cvs annotate :)

Have not followed through on this - yet.

> > - The unlock_addrs[] array enumerates the known unlock addresses.  I
> > have noticed that these address pairs can be x555/x2aa, x555/xaaa,
> > x5555/x2aaa, x5555/xaaaa, x0/x0.  Some of these pairs are not currently
> > listed because they are used for 8 bit mode on 16 bit devices.  Now tha=
t
> > these addresses are enumerated it might be better to iterate over the
> > list instead of keep state while shifting and or'ing.
>=20
> That's a sane idea and entirely orthogonal to the original change, I
> suppose.

Have not follewed through on this either.


--=20
Thayne Harbaugh
Linux Networx

--=-meGBAhbFME3LfCdvNDOx
Content-Disposition: attachment; filename=linux-2.4.21-pre4.mtd-jedec_match.patch
Content-Type: text/plain; name=linux-2.4.21-pre4.mtd-jedec_match.patch;
	charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

--- linux-2.4.21-pre4.mtd.orig/drivers/mtd/chips/jedec_probe.c	2003-02-03 1=
4:35:13.000000000 -0700
+++ linux-2.4.21-pre4.mtd/drivers/mtd/chips/jedec_probe.c	2003-03-03 13:44:=
36.000000000 -0700
@@ -26,6 +26,7 @@
 #define MANUFACTURER_FUJITSU	0x0004
 #define MANUFACTURER_INTEL	0x0089
 #define MANUFACTURER_MACRONIX	0x00C2
+#define MANUFACTURER_PMC	0x009D
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_TOSHIBA	0x0098
@@ -93,8 +94,14 @@
 #define MX29F004T	0x0045
 #define MX29F004B	0x0046
=20
+/* PMC */
+#define PM49FL002	0x006D
+#define PM49FL004	0x006E
+#define PM49FL008	0x006A
+
 /* ST - www.st.com */
-#define M29W800T	0x00D7
+#define M29W800DT	0x00D7
+#define M29W800DB	0x005B
 #define M29W160DT	0x22C4
 #define M29W160DB	0x2249
 #define M29W040B	0x00E3
@@ -123,6 +130,38 @@
 #define TC58FVB641	0x0095
=20
=20
+/*
+ * Unlock address sets for AMD command sets.
+ * Intel command sets use the MTD_UADDR_UNNECESSARY.
+ * Each identifier, except MTD_UADDR_UNNECESSARY, must
+ * be defined below in unlock_addrs[]
+ */
+enum uaddr {
+	MTD_UADDR_0x0555_0x02AA,
+	MTD_UADDR_0x5555_0x2AAA,
+	MTD_UADDR_DONT_CARE,		/* Requires an arbitrary address */
+	MTD_UADDR_UNNECESSARY		/* Does not require any address */
+};
+
+
+struct unlock_addr {
+	int addr1;
+	int addr2;
+};
+
+
+static struct unlock_addr  unlock_addrs[] =3D {
+	[MTD_UADDR_0x0555_0x02AA].addr1 =3D 0x0555,
+	[MTD_UADDR_0x0555_0x02AA].addr2 =3D 0x02aa,
+
+	[MTD_UADDR_0x5555_0x2AAA].addr1 =3D 0x5555,
+	[MTD_UADDR_0x5555_0x2AAA].addr2 =3D 0x2aaa,
+
+	[MTD_UADDR_DONT_CARE].addr1 =3D 0x0000, /* Doesn't matter which address *=
/
+	[MTD_UADDR_DONT_CARE].addr2 =3D 0x0000, /* is used - must be last entry *=
/
+};
+
+
 struct amd_flash_info {
 	const __u16 mfr_id;
 	const __u16 dev_id;
@@ -131,6 +170,7 @@
 	const int InterfaceDesc;
 	const int NumEraseRegions;
 	const int CmdSet;
+	const int uaddr;
 	const ulong regions[4];
 };
=20
@@ -150,6 +190,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F032B,
 		name: "AMD AM29F032B",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_4MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -159,6 +200,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV160DT,
 		name: "AMD AM29LV160DT",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -171,6 +213,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV160DB,
 		name: "AMD AM29LV160DB",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -183,6 +226,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVT160,
 		name: "Toshiba TC58FVT160",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -195,6 +239,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVB160,
 		name: "Toshiba TC58FVB160",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -207,6 +252,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVB321,
 		name: "Toshiba TC58FVB321",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_4MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -217,6 +263,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVT321,
 		name: "Toshiba TC58FVT321",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_4MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -227,6 +274,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVB641,
 		name: "Toshiba TC58FVB641",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_8MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -237,6 +285,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVT641,
 		name: "Toshiba TC58FVT641",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_8MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -247,6 +296,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV650UE,
 		name: "Fujitsu MBM29LV650UE",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_8MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -256,6 +306,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV320TE,
 		name: "Fujitsu MBM29LV320TE",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_4MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -266,6 +317,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV320BE,
 		name: "Fujitsu MBM29LV320BE",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_4MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -276,6 +328,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV160TE,
 		name: "Fujitsu MBM29LV160TE",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -288,6 +341,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV160BE,
 		name: "Fujitsu MBM29LV160BE",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -300,6 +354,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV800BA,
 		name: "Fujitsu MBM29LV800BA",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -312,6 +367,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV800TA,
 		name: "Fujitsu MBM29LV800TA",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -324,6 +380,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV800BB,
 		name: "AMD AM29LV800BB",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -336,6 +393,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F800BB,
 		name: "AMD AM29F800BB",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -348,6 +406,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV800BT,
 		name: "AMD AM29LV800BT",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -360,18 +419,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F800BT,
 		name: "AMD AM29F800BT",
-		DevSize: SIZE_1MiB,
-		CmdSet:	P_ID_AMD_STD,
-		NumEraseRegions: 4,
-		regions: {ERASEINFO(0x10000,15),
-			  ERASEINFO(0x08000,1),
-			  ERASEINFO(0x02000,2),
-			  ERASEINFO(0x04000,1)
-		}
-	}, {
-		mfr_id: MANUFACTURER_AMD,
-		dev_id: AM29LV800BB,
-		name: "AMD AM29LV800BB",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -384,6 +432,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F004B3B,
 		name:			"Intel 28F004B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_512KiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -395,6 +444,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F004B3T,
 		name:			"Intel 28F004B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_512KiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -406,6 +456,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F400B3B,
 		name:			"Intel 28F400B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_512KiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -417,6 +468,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F400B3T,
 		name:			"Intel 28F400B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_512KiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -428,6 +480,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F008B3B,
 		name:			"Intel 28F008B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_1MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -439,6 +492,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F008B3T,
 		name:			"Intel 28F008B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_1MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -450,6 +504,7 @@
 		mfr_id: MANUFACTURER_INTEL,
 		dev_id: I28F008S5,
 		name: "Intel 28F008S5",
+		uaddr: MTD_UADDR_UNNECESSARY,
 		DevSize: SIZE_1MiB,
 		CmdSet: P_ID_INTEL_EXT,
 		NumEraseRegions: 1,
@@ -459,6 +514,7 @@
 		mfr_id: MANUFACTURER_INTEL,
 		dev_id: I28F016S5,
 		name: "Intel 28F016S5",
+		uaddr: MTD_UADDR_UNNECESSARY,
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_INTEL_EXT,
 		NumEraseRegions: 1,
@@ -468,6 +524,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F008SA,
 		name:			"Intel 28F008SA",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_1MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	1,
@@ -478,6 +535,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F800B3B,
 		name:			"Intel 28F800B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_1MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -489,6 +547,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F800B3T,
 		name:			"Intel 28F800B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_1MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -500,6 +559,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F016B3B,
 		name:			"Intel 28F016B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_2MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -511,6 +571,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F016S3,
 		name:			"Intel I28F016S3",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_2MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	1,
@@ -521,6 +582,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F016B3T,
 		name:			"Intel 28F016B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_2MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -532,6 +594,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F160B3B,
 		name:			"Intel 28F160B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_2MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -543,6 +606,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F160B3T,
 		name:			"Intel 28F160B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_2MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -554,6 +618,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F320B3B,
 		name:			"Intel 28F320B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_4MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -565,6 +630,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F320B3T,
 		name:			"Intel 28F320B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_4MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -576,6 +642,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F640B3B,
 		name:			"Intel 28F640B3B",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_8MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -587,6 +654,7 @@
 		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F640B3T,
 		name:			"Intel 28F640B3T",
+		uaddr:			MTD_UADDR_UNNECESSARY,
 		DevSize:		SIZE_8MiB,
 		CmdSet:			P_ID_INTEL_STD,
 		NumEraseRegions:	2,
@@ -598,6 +666,7 @@
 		mfr_id: MANUFACTURER_INTEL,
 		dev_id: I82802AB,
 		name: "Intel 82802AB",
+		uaddr: MTD_UADDR_UNNECESSARY,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_INTEL_EXT,
 		NumEraseRegions: 1,
@@ -607,6 +676,7 @@
 		mfr_id: MANUFACTURER_INTEL,
 		dev_id: I82802AC,
 		name: "Intel 82802AC",
+		uaddr: MTD_UADDR_UNNECESSARY,
 		DevSize: SIZE_1MiB,
 		CmdSet: P_ID_INTEL_EXT,
 		NumEraseRegions: 1,
@@ -614,8 +684,9 @@
 		}
 	}, {
 		mfr_id: MANUFACTURER_ST,
-		dev_id: M29W800T,
-		name: "ST M29W800T",
+		dev_id: M29W800DT,
+		name: "ST M29W800DT",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_1MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -626,8 +697,22 @@
 		}
 	}, {
 		mfr_id: MANUFACTURER_ST,
+		dev_id: M29W800DB,
+		name: "ST M29W800DB",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
+		DevSize: SIZE_1MiB,
+		CmdSet:	P_ID_AMD_STD,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x04000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x10000,15)
+		}
+	}, {
+		mfr_id: MANUFACTURER_ST,
 		dev_id: M29W160DT,
 		name: "ST M29W160DT",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -640,6 +725,7 @@
 		mfr_id: MANUFACTURER_ST,
 		dev_id: M29W160DB,
 		name: "ST M29W160DB",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_2MiB,
 		CmdSet:	P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -652,6 +738,7 @@
 		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT49BV512,
 		name: "Atmel AT49BV512",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_64KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -661,6 +748,7 @@
 		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT29LV512,
 		name: "Atmel AT29LV512",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_64KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -672,6 +760,7 @@
 		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT49BV16X,
 		name: "Atmel AT49BV16X",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -682,6 +771,7 @@
 		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT49BV16XT,
 		name: "Atmel AT49BV16XT",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -692,6 +782,7 @@
 		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT49BV32X,
 		name: "Atmel AT49BV32X",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_4MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -702,6 +793,7 @@
 		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT49BV32XT,
 		name: "Atmel AT49BV32XT",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_4MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 2,
@@ -712,6 +804,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F017D,
 		name: "AMD AM29F017D",
+		uaddr: MTD_UADDR_DONT_CARE,
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -721,6 +814,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F016,
 		name: "AMD AM29F016",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -730,6 +824,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F080,
 		name: "AMD AM29F080",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_1MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -739,6 +834,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F040,
 		name: "AMD AM29F040",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -748,6 +844,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV040B,
 		name: "AMD AM29LV040B",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -757,6 +854,7 @@
 		mfr_id: MANUFACTURER_ST,
 		dev_id: M29W040B,
 		name: "ST M29W040B",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - verify */
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -766,6 +864,7 @@
 		mfr_id: MANUFACTURER_MACRONIX,
 		dev_id: MX29LV160T,
 		name: "MXIC MX29LV160T",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -778,6 +877,7 @@
 		mfr_id: MANUFACTURER_MACRONIX,
 		dev_id: MX29LV160B,
 		name: "MXIC MX29LV160B",
+		uaddr: MTD_UADDR_0x0555_0x02AA, /* FIXME - for words, not bytes!! */
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -790,6 +890,7 @@
 		mfr_id: MANUFACTURER_MACRONIX,
 		dev_id: MX29F016,
 		name: "Macronix MX29F016",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_2MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -799,6 +900,7 @@
 		mfr_id: MANUFACTURER_MACRONIX,
 		dev_id: MX29F004T,
 		name: "Macronix MX29F004T",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -811,6 +913,7 @@
 		mfr_id: MANUFACTURER_MACRONIX,
 		dev_id: MX29F004B,
 		name: "Macronix MX29F004B",
+		uaddr: MTD_UADDR_0x0555_0x02AA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 4,
@@ -823,6 +926,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39LF512,
 		name: "SST 39LF512",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_64KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -832,6 +936,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39LF010,
 		name: "SST 39LF010",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_128KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -841,6 +946,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39LF020,
 		name: "SST 39LF020",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_256KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -850,6 +956,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39LF040,
 		name: "SST 39LF040",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -859,6 +966,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39SF010A,
 		name: "SST 39SF010A",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_128KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -868,6 +976,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST39SF020A,
 		name: "SST 39SF020A",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_256KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -877,6 +986,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST49LF030A,
 		name: "SST 49LF030A",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -886,6 +996,7 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST49LF040A,
 		name: "SST 49LF040A",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_512KiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
@@ -895,11 +1006,45 @@
 		mfr_id: MANUFACTURER_SST,
 		dev_id: SST49LF080A,
 		name: "SST 49LF080A",
+		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_1MiB,
 		CmdSet: P_ID_AMD_STD,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,256),
 		}
+	}, {
+		mfr_id:          MANUFACTURER_PMC,
+		dev_id:          PM49FL002,
+		name:            "PMC_Pm49FL002",
+		uaddr:           MTD_UADDR_0x5555_0x2AAA,
+		DevSize:         SIZE_256KiB,
+		CmdSet:          P_ID_AMD_STD,
+		NumEraseRegions: 1,
+		regions:         {
+			ERASEINFO( 0x01000, 64 )
+		}
+	}, {
+		mfr_id:          MANUFACTURER_PMC,
+		dev_id:          PM49FL004,
+		name:            "PMC_Pm49FL004",
+		uaddr:           MTD_UADDR_0x5555_0x2AAA,
+		DevSize:         SIZE_512KiB,
+		CmdSet:          P_ID_AMD_STD,
+		NumEraseRegions: 1,
+		regions:         {
+			ERASEINFO( 0x01000, 128 )
+		}
+	}, {
+		mfr_id:          MANUFACTURER_PMC,
+		dev_id:          PM49FL008,
+		name:            "PMC_Pm49FL008",
+		uaddr:           MTD_UADDR_0x5555_0x2AAA,
+		DevSize:         SIZE_1MiB,
+		CmdSet:          P_ID_AMD_STD,
+		NumEraseRegions: 1,
+		regions:         {
+			ERASEINFO( 0x01000, 256 )
+		}
 	}=20
 };
=20
@@ -974,6 +1119,100 @@
 	return 1; 	/* ok */
 }
=20
+
+/*
+ * There is a BIG problem properly ID'ing the JEDEC devic and guaranteeing
+ * the mapped address, unlock addresses, and proper chip ID.  This functio=
n
+ * attempts to minimize errors.  It is doubtfull that this probe will ever
+ * be perfect - consequently there should be some module parameters that
+ * could be manually specified to force the chip info.
+ */
+static inline int jedec_match( __u32 base, struct map_info *map, struct cf=
i_private *cfi, int i )
+{
+	int blocks, blk_size; /* # blocks and block size */
+	int blk;              /* block iterator */
+	int rc =3D 0;           /* failure until all tests pass */
+	u32 mfr, id;
+
+	/* The ID's must match */
+	if ( cfi->mfr !=3D jedec_table[i].mfr_id
+	     || cfi->id !=3D jedec_table[i].dev_id ) {
+		goto match_done;
+	}
+
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs\n", __func__ );
+	/* unlock addresses must match */
+	if ( MTD_UADDR_UNNECESSARY !=3D jedec_table[i].uaddr
+	     && MTD_UADDR_DONT_CARE !=3D jedec_table[i].uaddr
+	     && ( unlock_addrs[jedec_table[i].uaddr].addr1 !=3D cfi->addr_unlock1
+		  || unlock_addrs[jedec_table[i].uaddr].addr2 !=3D cfi->addr_unlock2 ) )=
 {
+		goto match_done;
+	}
+
+	/*
+	 * In ID mode the ID should be found at the start of each
+	 * erase block.
+	 */
+	blk_size =3D jedec_table[i].regions[0] >> 8;
+	blocks =3D ( jedec_table[i].regions[0] & 0x00ff ) + 1;
+	DEBUG( MTD_DEBUG_LEVEL3,
+	       "MTD %s(): check ID's in every block: %dx%d\n",
+	       __func__, blk_size, blocks );
+
+	for ( blk =3D 0; blk < blocks; blk++ ) {
+		mfr =3D cfi_read( map, blk * blk_size );
+		id  =3D cfi_read( map, blk * blk_size + 1 );
+
+		if ( cfi->mfr !=3D mfr || cfi->id !=3D id ) {
+			DEBUG( MTD_DEBUG_LEVEL3,
+			       "MTD %s(): did not find ID 0x%.2x:0x%.2x in block %d\n",
+			       __func__, cfi->mfr, cfi->id, blk );
+			goto match_done;
+		}
+	}
+
+	/*
+	 * Make sure the ID's dissappear in at least one of the blocks
+	 * when the device is taken out of ID mode.  The only time this
+	 * should fail is when the ID's are written as data to the same
+	 * addresses.  For this rare and unfortunate case the chip
+	 * cannot be probed correctly.
+	 * FIXME - write a driver that takes all of the chip info as
+	 * module parameters.
+	 */
+	DEBUG( MTD_DEBUG_LEVEL3,
+	       "MTD %s(): check ID's disappear when not in ID mode\n",
+	       __func__ );
+	jedec_reset( base, map, cfi );
+	mfr =3D jedec_read_mfr( map, base, cfi );
+	id =3D jedec_read_id( map, base, cfi );
+	if ( mfr =3D=3D cfi->mfr && id =3D=3D cfi->id ) {
+		DEBUG( MTD_DEBUG_LEVEL3,
+		       "MTD %s(): ID 0x%.2x:0x%.2x did not change after reset:\n"
+		       "You might need to manually specify JEDEC parameters.\n",
+			__func__, cfi->mfr, cfi->id );
+		goto match_done;
+	}
+
+	/* all tests passed - mark as success */
+	rc =3D 1;
+
+	/*
+	 * Put the device back in ID mode - only need to do this if we
+	 * were truly frobbing a real device.
+	 */
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__ );
+	if(cfi->addr_unlock1) {
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE=
_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE=
_X8, NULL);
+	}
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_=
X8, NULL);
+
+ match_done:=09
+	return rc;
+}
+
+
 static int jedec_probe_chip(struct map_info *map, __u32 base,
 			      struct flchip *chips, struct cfi_private *cfi)
 {
@@ -983,8 +1222,8 @@
 	if (!cfi->numchips) {
 		switch (cfi->device_type) {
 		case CFI_DEVICETYPE_X8:
-			cfi->addr_unlock1 =3D 0x555;=20
-			cfi->addr_unlock2 =3D 0x2aa;=20
+			cfi->addr_unlock1 =3D 0x555;
+			cfi->addr_unlock2 =3D 0x2aa;
 			break;
 		case CFI_DEVICETYPE_X16:
 			cfi->addr_unlock1 =3D 0xaaa;
@@ -1048,8 +1287,12 @@
 		printk(KERN_INFO "Search for id:(%02x %02x) interleave(%d) type(%d)\n",=20
 			cfi->mfr, cfi->id, cfi->interleave, cfi->device_type);
 		for (i=3D0; i<sizeof(jedec_table)/sizeof(jedec_table[0]); i++) {
-			if (cfi->mfr =3D=3D jedec_table[i].mfr_id &&
-			    cfi->id =3D=3D jedec_table[i].dev_id) {
+			if ( jedec_match( base, map, cfi, i ) ) {
+				DEBUG( MTD_DEBUG_LEVEL3,
+				       "MTD %s(): matched device 0x%x,0x%x unlock_addrs: 0x%.4x 0x%.4x=
\n",
+				       __func__,
+				       cfi->mfr, cfi->id,
+				       cfi->addr_unlock1, cfi->addr_unlock2 );
 				if (!cfi_jedec_setup(cfi, i))
 					return 0;
 				goto ok_out;

--=-meGBAhbFME3LfCdvNDOx--

--=-5rgJ2igtPlOXDJ21tYiT
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+Y741fsBPTKE6HMkRAuHNAJ9pNacigcIEAsMlJikC3zMDbb1MqQCeJ/AV
ZKUZgbM9ajFxvPS6vcg2vig=
=GcE0
-----END PGP SIGNATURE-----

--=-5rgJ2igtPlOXDJ21tYiT--
