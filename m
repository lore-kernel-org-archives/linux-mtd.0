Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQV-0002gu-8F
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:11 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jani Nikula <jani.nikula@intel.com>,
 "Herton R. Krzesinski" <herton@redhat.com>,
 Markus Heiser <markus.heiser@darmarit.de>,
 Silvio Fricke <silvio.fricke@gmail.com>,
 sayli karnik <karniksayli1995@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 36/53] docs-rst: convert librs book to ReST
Date: Tue, 16 May 2017 09:16:28 -0300
Message-Id: <8aba78483226a9904e1e1790853a25f5a08abbd0.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use pandoc to convert documentation to ReST by calling
Documentation/sphinx/tmplcvt script.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/DocBook/Makefile   |   2 +-
 Documentation/DocBook/librs.tmpl | 289 ---------------------------------------
 Documentation/core-api/index.rst |   1 +
 Documentation/core-api/librs.rst | 212 ++++++++++++++++++++++++++++
 4 files changed, 214 insertions(+), 290 deletions(-)
 delete mode 100644 Documentation/DocBook/librs.tmpl
 create mode 100644 Documentation/core-api/librs.rst

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index baedb14f3b40..0a82f6253682 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -8,7 +8,7 @@
 
 DOCBOOKS := \
 	    lsm.xml \
-	    mtdnand.xml librs.xml \
+	    mtdnand.xml \
 	    sh.xml
 
 ifeq ($(DOCBOOKS),)
diff --git a/Documentation/DocBook/librs.tmpl b/Documentation/DocBook/librs.tmpl
deleted file mode 100644
index 94f21361e0ed..000000000000
--- a/Documentation/DocBook/librs.tmpl
+++ /dev/null
@@ -1,289 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
-	"http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" []>
-
-<book id="Reed-Solomon-Library-Guide">
- <bookinfo>
-  <title>Reed-Solomon Library Programming Interface</title>
-  
-  <authorgroup>
-   <author>
-    <firstname>Thomas</firstname>
-    <surname>Gleixner</surname>
-    <affiliation>
-     <address>
-      <email>tglx@linutronix.de</email>
-     </address>
-    </affiliation>
-   </author>
-  </authorgroup>
-
-  <copyright>
-   <year>2004</year>
-   <holder>Thomas Gleixner</holder>
-  </copyright>
-
-  <legalnotice>
-   <para>
-     This documentation is free software; you can redistribute
-     it and/or modify it under the terms of the GNU General Public
-     License version 2 as published by the Free Software Foundation.
-   </para>
-      
-   <para>
-     This program is distributed in the hope that it will be
-     useful, but WITHOUT ANY WARRANTY; without even the implied
-     warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-     See the GNU General Public License for more details.
-   </para>
-      
-   <para>
-     You should have received a copy of the GNU General Public
-     License along with this program; if not, write to the Free
-     Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
-     MA 02111-1307 USA
-   </para>
-      
-   <para>
-     For more details see the file COPYING in the source
-     distribution of Linux.
-   </para>
-  </legalnotice>
- </bookinfo>
-
-<toc></toc>
-
-  <chapter id="intro">
-      <title>Introduction</title>
-  <para>
-  	The generic Reed-Solomon Library provides encoding, decoding
-	and error correction functions.
-  </para>
-  <para>
-  	Reed-Solomon codes are used in communication and storage
-	applications to ensure data integrity. 
-  </para>
-  <para>
-  	This documentation is provided for developers who want to utilize
-	the functions provided by the library.
-  </para>
-  </chapter>
-  
-  <chapter id="bugs">
-     <title>Known Bugs And Assumptions</title>
-  <para>
-	None.	
-  </para>
-  </chapter>
-
-  <chapter id="usage">
-     	<title>Usage</title>
-	<para>
-		This chapter provides examples of how to use the library.
-	</para>
-	<sect1>
-		<title>Initializing</title>
-		<para>
-			The init function init_rs returns a pointer to an
-			rs decoder structure, which holds the necessary
-			information for encoding, decoding and error correction
-			with the given polynomial. It either uses an existing
-			matching decoder or creates a new one. On creation all
-			the lookup tables for fast en/decoding are created.
-			The function may take a while, so make sure not to 
-			call it in critical code paths.
-		</para>
-		<programlisting>
-/* the Reed Solomon control structure */
-static struct rs_control *rs_decoder;
-
-/* Symbolsize is 10 (bits)
- * Primitive polynomial is x^10+x^3+1
- * first consecutive root is 0
- * primitive element to generate roots = 1
- * generator polynomial degree (number of roots) = 6
- */
-rs_decoder = init_rs (10, 0x409, 0, 1, 6);
-		</programlisting>
-	</sect1>
-	<sect1>
-		<title>Encoding</title>
-		<para>
-			The encoder calculates the Reed-Solomon code over
-			the given data length and stores the result in 
-			the parity buffer. Note that the parity buffer must
-			be initialized before calling the encoder.
-		</para>
-		<para>
-			The expanded data can be inverted on the fly by
-			providing a non-zero inversion mask. The expanded data is
-			XOR'ed with the mask. This is used e.g. for FLASH
-			ECC, where the all 0xFF is inverted to an all 0x00.
-			The Reed-Solomon code for all 0x00 is all 0x00. The
-			code is inverted before storing to FLASH so it is 0xFF
-			too. This prevents that reading from an erased FLASH
-			results in ECC errors.
-		</para>
-		<para>
-			The databytes are expanded to the given symbol size
-			on the fly. There is no support for encoding continuous
-			bitstreams with a symbol size != 8 at the moment. If
-			it is necessary it should be not a big deal to implement
-			such functionality.
-		</para>
-		<programlisting>
-/* Parity buffer. Size = number of roots */
-uint16_t par[6];
-/* Initialize the parity buffer */
-memset(par, 0, sizeof(par));
-/* Encode 512 byte in data8. Store parity in buffer par */
-encode_rs8 (rs_decoder, data8, 512, par, 0);
-		</programlisting>
-	</sect1>
-	<sect1>
-		<title>Decoding</title>
-		<para>
-			The decoder calculates the syndrome over
-			the given data length and the received parity symbols
-			and corrects errors in the data.
-		</para>
-		<para>
-			If a syndrome is available from a hardware decoder
-			then the syndrome calculation is skipped.
-		</para>
-		<para>
-			The correction of the data buffer can be suppressed
-			by providing a correction pattern buffer and an error
-			location buffer to the decoder. The decoder stores the
-			calculated error location and the correction bitmask
-			in the given buffers. This is useful for hardware
-			decoders which use a weird bit ordering scheme.
-		</para>
-		<para>
-			The databytes are expanded to the given symbol size
-			on the fly. There is no support for decoding continuous
-			bitstreams with a symbolsize != 8 at the moment. If
-			it is necessary it should be not a big deal to implement
-			such functionality.
-		</para>
-		
-		<sect2>
-		<title>
-			Decoding with syndrome calculation, direct data correction
-		</title>
-		<programlisting>
-/* Parity buffer. Size = number of roots */
-uint16_t par[6];
-uint8_t  data[512];
-int numerr;
-/* Receive data */
-.....
-/* Receive parity */
-.....
-/* Decode 512 byte in data8.*/
-numerr = decode_rs8 (rs_decoder, data8, par, 512, NULL, 0, NULL, 0, NULL);
-		</programlisting>
-		</sect2>
-
-		<sect2>
-		<title>
-			Decoding with syndrome given by hardware decoder, direct data correction
-		</title>
-		<programlisting>
-/* Parity buffer. Size = number of roots */
-uint16_t par[6], syn[6];
-uint8_t  data[512];
-int numerr;
-/* Receive data */
-.....
-/* Receive parity */
-.....
-/* Get syndrome from hardware decoder */
-.....
-/* Decode 512 byte in data8.*/
-numerr = decode_rs8 (rs_decoder, data8, par, 512, syn, 0, NULL, 0, NULL);
-		</programlisting>
-		</sect2>
-
-		<sect2>
-		<title>
-			Decoding with syndrome given by hardware decoder, no direct data correction.
-		</title>
-		<para>
-			Note: It's not necessary to give data and received parity to the decoder.
-		</para>
-		<programlisting>
-/* Parity buffer. Size = number of roots */
-uint16_t par[6], syn[6], corr[8];
-uint8_t  data[512];
-int numerr, errpos[8];
-/* Receive data */
-.....
-/* Receive parity */
-.....
-/* Get syndrome from hardware decoder */
-.....
-/* Decode 512 byte in data8.*/
-numerr = decode_rs8 (rs_decoder, NULL, NULL, 512, syn, 0, errpos, 0, corr);
-for (i = 0; i &lt; numerr; i++) {
-	do_error_correction_in_your_buffer(errpos[i], corr[i]);
-}
-		</programlisting>
-		</sect2>
-	</sect1>
-	<sect1>
-		<title>Cleanup</title>
-		<para>
-			The function free_rs frees the allocated resources,
-			if the caller is the last user of the decoder.
-		</para>
-		<programlisting>
-/* Release resources */
-free_rs(rs_decoder);
-		</programlisting>
-	</sect1>
-
-  </chapter>
-	
-  <chapter id="structs">
-     <title>Structures</title>
-     <para>
-     This chapter contains the autogenerated documentation of the structures which are
-     used in the Reed-Solomon Library and are relevant for a developer.
-     </para>
-!Iinclude/linux/rslib.h
-  </chapter>
-
-  <chapter id="pubfunctions">
-     <title>Public Functions Provided</title>
-     <para>
-     This chapter contains the autogenerated documentation of the Reed-Solomon functions
-     which are exported.
-     </para>
-!Elib/reed_solomon/reed_solomon.c
-  </chapter>
-  
-  <chapter id="credits">
-     <title>Credits</title>
-	<para>
-		The library code for encoding and decoding was written by Phil Karn.
-	</para>
-	<programlisting>
-		Copyright 2002, Phil Karn, KA9Q
- 		May be used under the terms of the GNU General Public License (GPL)
-	</programlisting>
-	<para>
-		The wrapper functions and interfaces are written by Thomas Gleixner.
-	</para>
-	<para>
-		Many users have provided bugfixes, improvements and helping hands for testing.
-		Thanks a lot.
-	</para>
-	<para>
-		The following people have contributed to this document:
-	</para>
-	<para>
-		Thomas Gleixner<email>tglx@linutronix.de</email>
-	</para>
-  </chapter>
-</book>
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 62abd36bfffb..0606be3a3111 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -19,6 +19,7 @@ Core utilities
    workqueue
    genericirq
    flexible-arrays
+   librs
 
 Interfaces for kernel debugging
 ===============================
diff --git a/Documentation/core-api/librs.rst b/Documentation/core-api/librs.rst
new file mode 100644
index 000000000000..6010f5bc5bf9
--- /dev/null
+++ b/Documentation/core-api/librs.rst
@@ -0,0 +1,212 @@
+==========================================
+Reed-Solomon Library Programming Interface
+==========================================
+
+:Author: Thomas Gleixner
+
+Introduction
+============
+
+The generic Reed-Solomon Library provides encoding, decoding and error
+correction functions.
+
+Reed-Solomon codes are used in communication and storage applications to
+ensure data integrity.
+
+This documentation is provided for developers who want to utilize the
+functions provided by the library.
+
+Known Bugs And Assumptions
+==========================
+
+None.
+
+Usage
+=====
+
+This chapter provides examples of how to use the library.
+
+Initializing
+------------
+
+The init function init_rs returns a pointer to an rs decoder structure,
+which holds the necessary information for encoding, decoding and error
+correction with the given polynomial. It either uses an existing
+matching decoder or creates a new one. On creation all the lookup tables
+for fast en/decoding are created. The function may take a while, so make
+sure not to call it in critical code paths.
+
+::
+
+    /* the Reed Solomon control structure */
+    static struct rs_control *rs_decoder;
+
+    /* Symbolsize is 10 (bits)
+     * Primitive polynomial is x^10+x^3+1
+     * first consecutive root is 0
+     * primitive element to generate roots = 1
+     * generator polynomial degree (number of roots) = 6
+     */
+    rs_decoder = init_rs (10, 0x409, 0, 1, 6);
+
+
+Encoding
+--------
+
+The encoder calculates the Reed-Solomon code over the given data length
+and stores the result in the parity buffer. Note that the parity buffer
+must be initialized before calling the encoder.
+
+The expanded data can be inverted on the fly by providing a non-zero
+inversion mask. The expanded data is XOR'ed with the mask. This is used
+e.g. for FLASH ECC, where the all 0xFF is inverted to an all 0x00. The
+Reed-Solomon code for all 0x00 is all 0x00. The code is inverted before
+storing to FLASH so it is 0xFF too. This prevents that reading from an
+erased FLASH results in ECC errors.
+
+The databytes are expanded to the given symbol size on the fly. There is
+no support for encoding continuous bitstreams with a symbol size != 8 at
+the moment. If it is necessary it should be not a big deal to implement
+such functionality.
+
+::
+
+    /* Parity buffer. Size = number of roots */
+    uint16_t par[6];
+    /* Initialize the parity buffer */
+    memset(par, 0, sizeof(par));
+    /* Encode 512 byte in data8. Store parity in buffer par */
+    encode_rs8 (rs_decoder, data8, 512, par, 0);
+
+
+Decoding
+--------
+
+The decoder calculates the syndrome over the given data length and the
+received parity symbols and corrects errors in the data.
+
+If a syndrome is available from a hardware decoder then the syndrome
+calculation is skipped.
+
+The correction of the data buffer can be suppressed by providing a
+correction pattern buffer and an error location buffer to the decoder.
+The decoder stores the calculated error location and the correction
+bitmask in the given buffers. This is useful for hardware decoders which
+use a weird bit ordering scheme.
+
+The databytes are expanded to the given symbol size on the fly. There is
+no support for decoding continuous bitstreams with a symbolsize != 8 at
+the moment. If it is necessary it should be not a big deal to implement
+such functionality.
+
+Decoding with syndrome calculation, direct data correction
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+::
+
+    /* Parity buffer. Size = number of roots */
+    uint16_t par[6];
+    uint8_t  data[512];
+    int numerr;
+    /* Receive data */
+    .....
+    /* Receive parity */
+    .....
+    /* Decode 512 byte in data8.*/
+    numerr = decode_rs8 (rs_decoder, data8, par, 512, NULL, 0, NULL, 0, NULL);
+
+
+Decoding with syndrome given by hardware decoder, direct data correction
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+::
+
+    /* Parity buffer. Size = number of roots */
+    uint16_t par[6], syn[6];
+    uint8_t  data[512];
+    int numerr;
+    /* Receive data */
+    .....
+    /* Receive parity */
+    .....
+    /* Get syndrome from hardware decoder */
+    .....
+    /* Decode 512 byte in data8.*/
+    numerr = decode_rs8 (rs_decoder, data8, par, 512, syn, 0, NULL, 0, NULL);
+
+
+Decoding with syndrome given by hardware decoder, no direct data correction.
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Note: It's not necessary to give data and received parity to the
+decoder.
+
+::
+
+    /* Parity buffer. Size = number of roots */
+    uint16_t par[6], syn[6], corr[8];
+    uint8_t  data[512];
+    int numerr, errpos[8];
+    /* Receive data */
+    .....
+    /* Receive parity */
+    .....
+    /* Get syndrome from hardware decoder */
+    .....
+    /* Decode 512 byte in data8.*/
+    numerr = decode_rs8 (rs_decoder, NULL, NULL, 512, syn, 0, errpos, 0, corr);
+    for (i = 0; i < numerr; i++) {
+        do_error_correction_in_your_buffer(errpos[i], corr[i]);
+    }
+
+
+Cleanup
+-------
+
+The function free_rs frees the allocated resources, if the caller is
+the last user of the decoder.
+
+::
+
+    /* Release resources */
+    free_rs(rs_decoder);
+
+
+Structures
+==========
+
+This chapter contains the autogenerated documentation of the structures
+which are used in the Reed-Solomon Library and are relevant for a
+developer.
+
+.. kernel-doc:: include/linux/rslib.h
+   :internal:
+
+Public Functions Provided
+=========================
+
+This chapter contains the autogenerated documentation of the
+Reed-Solomon functions which are exported.
+
+.. kernel-doc:: lib/reed_solomon/reed_solomon.c
+   :export:
+
+Credits
+=======
+
+The library code for encoding and decoding was written by Phil Karn.
+
+::
+
+            Copyright 2002, Phil Karn, KA9Q
+            May be used under the terms of the GNU General Public License (GPL)
+
+
+The wrapper functions and interfaces are written by Thomas Gleixner.
+
+Many users have provided bugfixes, improvements and helping hands for
+testing. Thanks a lot.
+
+The following people have contributed to this document:
+
+Thomas Gleixner\ tglx@linutronix.de
-- 
2.9.3
