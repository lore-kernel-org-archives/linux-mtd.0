Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000P0-Pp
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:45 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 13/31] digsig.txt: standardize document format
Date: Thu, 18 May 2017 22:22:18 -0300
Message-Id: <2476e971e4fa6433b7d5af980314d93d1a7b51be.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- comment the internal index;
- use the proper markups for titles;
- mark literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/digsig.txt | 124 ++++++++++++++++++++++++-----------------------
 1 file changed, 64 insertions(+), 60 deletions(-)

diff --git a/Documentation/digsig.txt b/Documentation/digsig.txt
index 3f682889068b..7ce23eddee37 100644
--- a/Documentation/digsig.txt
+++ b/Documentation/digsig.txt
@@ -1,13 +1,19 @@
 Digital Signature Verification API
+----------------------------------
 
-CONTENTS
+:Author: Dmitry Kasatkin
+:Date: 06.10.2011
 
-1. Introduction
-2. API
-3. User-space utilities
 
+.. CONTENTS
 
-1. Introduction
+   1. Introduction
+   2. API
+   3. User-space utilities
+
+
+Introduction
+============
 
 Digital signature verification API provides a method to verify digital signature.
 Currently digital signatures are used by the IMA/EVM integrity protection subsystem.
@@ -17,25 +23,25 @@ GnuPG multi-precision integers (MPI) library. The kernel port provides
 memory allocation errors handling, has been refactored according to kernel
 coding style, and checkpatch.pl reported errors and warnings have been fixed.
 
-Public key and signature consist of header and MPIs.
+Public key and signature consist of header and MPIs::
 
-struct pubkey_hdr {
-	uint8_t		version;	/* key format version */
-	time_t		timestamp;	/* key made, always 0 for now */
-	uint8_t		algo;
-	uint8_t		nmpi;
-	char		mpi[0];
-} __packed;
+	struct pubkey_hdr {
+		uint8_t		version;	/* key format version */
+		time_t		timestamp;	/* key made, always 0 for now */
+		uint8_t		algo;
+		uint8_t		nmpi;
+		char		mpi[0];
+	} __packed;
 
-struct signature_hdr {
-	uint8_t		version;	/* signature format version */
-	time_t		timestamp;	/* signature made */
-	uint8_t		algo;
-	uint8_t		hash;
-	uint8_t		keyid[8];
-	uint8_t		nmpi;
-	char		mpi[0];
-} __packed;
+	struct signature_hdr {
+		uint8_t		version;	/* signature format version */
+		time_t		timestamp;	/* signature made */
+		uint8_t		algo;
+		uint8_t		hash;
+		uint8_t		keyid[8];
+		uint8_t		nmpi;
+		char		mpi[0];
+	} __packed;
 
 keyid equals to SHA1[12-19] over the total key content.
 Signature header is used as an input to generate a signature.
@@ -43,31 +49,33 @@ Such approach insures that key or signature header could not be changed.
 It protects timestamp from been changed and can be used for rollback
 protection.
 
-2. API
+API
+===
 
-API currently includes only 1 function:
+API currently includes only 1 function::
 
 	digsig_verify() - digital signature verification with public key
 
 
-/**
- * digsig_verify() - digital signature verification with public key
- * @keyring:	keyring to search key in
- * @sig:	digital signature
- * @sigen:	length of the signature
- * @data:	data
- * @datalen:	length of the data
- * @return:	0 on success, -EINVAL otherwise
- *
- * Verifies data integrity against digital signature.
- * Currently only RSA is supported.
- * Normally hash of the content is used as a data for this function.
- *
- */
-int digsig_verify(struct key *keyring, const char *sig, int siglen,
-						const char *data, int datalen);
+	/**
+	* digsig_verify() - digital signature verification with public key
+	* @keyring:	keyring to search key in
+	* @sig:	digital signature
+	* @sigen:	length of the signature
+	* @data:	data
+	* @datalen:	length of the data
+	* @return:	0 on success, -EINVAL otherwise
+	*
+	* Verifies data integrity against digital signature.
+	* Currently only RSA is supported.
+	* Normally hash of the content is used as a data for this function.
+	*
+	*/
+	int digsig_verify(struct key *keyring, const char *sig, int siglen,
+			  const char *data, int datalen);
 
-3. User-space utilities
+User-space utilities
+====================
 
 The signing and key management utilities evm-utils provide functionality
 to generate signatures, to load keys into the kernel keyring.
@@ -75,22 +83,18 @@ Keys can be in PEM or converted to the kernel format.
 When the key is added to the kernel keyring, the keyid defines the name
 of the key: 5D2B05FC633EE3E8 in the example bellow.
 
-Here is example output of the keyctl utility.
-
-$ keyctl show
-Session Keyring
-       -3 --alswrv      0     0  keyring: _ses
-603976250 --alswrv      0    -1   \_ keyring: _uid.0
-817777377 --alswrv      0     0       \_ user: kmk
-891974900 --alswrv      0     0       \_ encrypted: evm-key
-170323636 --alswrv      0     0       \_ keyring: _module
-548221616 --alswrv      0     0       \_ keyring: _ima
-128198054 --alswrv      0     0       \_ keyring: _evm
-
-$ keyctl list 128198054
-1 key in keyring:
-620789745: --alswrv     0     0 user: 5D2B05FC633EE3E8
-
-
-Dmitry Kasatkin
-06.10.2011
+Here is example output of the keyctl utility::
+
+	$ keyctl show
+	Session Keyring
+	-3 --alswrv      0     0  keyring: _ses
+	603976250 --alswrv      0    -1   \_ keyring: _uid.0
+	817777377 --alswrv      0     0       \_ user: kmk
+	891974900 --alswrv      0     0       \_ encrypted: evm-key
+	170323636 --alswrv      0     0       \_ keyring: _module
+	548221616 --alswrv      0     0       \_ keyring: _ima
+	128198054 --alswrv      0     0       \_ keyring: _evm
+
+	$ keyctl list 128198054
+	1 key in keyring:
+	620789745: --alswrv     0     0 user: 5D2B05FC633EE3E8
-- 
2.9.4
