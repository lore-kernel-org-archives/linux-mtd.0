From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 12 Feb 2003 13:29:04 -0700
Subject: PMC entry in jedec_table[]
Message-ID: <1045081744.12667.85.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-RDbju2dl2sg3L2urX61e
Content-Type: multipart/mixed; boundary="=-LMJFVgpAQMsxFLiSDWMt"


--=-LMJFVgpAQMsxFLiSDWMt
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds PMC flash chips to the jedec_table[].  Unfortunately
this patch is necessary but not sufficient to use PMC flash devices.=20
Expect another patch soon that will make PMC devices work with
cfi_cmdset_0002 (I have things working now, I just need to do some
clean-up).

--=20
Thayne Harbaugh
Linux Networx

--=-LMJFVgpAQMsxFLiSDWMt
Content-Disposition: attachment; filename=linux-2.4.21-pre4-mtd_pmc.patch
Content-Type: text/plain; name=linux-2.4.21-pre4-mtd_pmc.patch; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

--- linux-2.4.21-pre4.mtd.orig/drivers/mtd/chips/jedec_probe.c	2003-02-03 1=
4:35:13.000000000 -0700
+++ linux-2.4.21-pre4.mtd/drivers/mtd/chips/jedec_probe.c	2003-02-12 13:09:=
31.000000000 -0700
@@ -26,6 +26,7 @@
 #define MANUFACTURER_FUJITSU	0x0004
 #define MANUFACTURER_INTEL	0x0089
 #define MANUFACTURER_MACRONIX	0x00C2
+#define MANUFACTURER_PMC	0x009D
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_TOSHIBA	0x0098
@@ -93,6 +94,11 @@
 #define MX29F004T	0x0045
 #define MX29F004B	0x0046
=20
+/* PMC */
+#define PM49FL002	0x006D
+#define PM49FL004	0x006E
+#define PM49FL008	0x006A
+
 /* ST - www.st.com */
 #define M29W800T	0x00D7
 #define M29W160DT	0x22C4
@@ -900,6 +906,36 @@
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,256),
 		}
+	}, {
+		mfr_id:          MANUFACTURER_PMC,
+		dev_id:          PM49FL002,
+		name:            "PMC_Pm49FL002",
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
+		DevSize:         SIZE_1MiB,
+		CmdSet:          P_ID_AMD_STD,
+		NumEraseRegions: 1,
+		regions:         {
+			ERASEINFO( 0x01000, 256 )
+		}
 	}=20
 };
=20

--=-LMJFVgpAQMsxFLiSDWMt--

--=-RDbju2dl2sg3L2urX61e
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+Sq6QfsBPTKE6HMkRAi14AJ9IqfQxNKiNiRw3z8l344UeW8/fSwCfRGJz
+3jzCtxsNgrjU5UU8cd07s8=
=ZmIC
-----END PGP SIGNATURE-----

--=-RDbju2dl2sg3L2urX61e--
