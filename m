Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19DnUc-0000ns-Km
	for <linux-mtd@lists.infradead.org>; Thu, 08 May 2003 16:39:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Message-Id: <1052408387.23135.9.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 08 May 2003 16:39:47 +0100
Content-Type: multipart/mixed; boundary="=-MAPxwXj0qidvehaT8Wrq"
cc: Axel Ludszuweit <alu@keymile.com>
Subject: [Fwd: helper routines for flash chip probing, search sequence]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MAPxwXj0qidvehaT8Wrq
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I meant the MTD list really, not linux-kernel. Sorry, I should have made
that explicit.

-- 
dwmw2

--=-MAPxwXj0qidvehaT8Wrq
Content-Disposition: inline
Content-Description: Forwarded message - helper routines for flash chip
	probing, search sequence
Content-Type: message/rfc822


>From linux-kernel-owner+l-k=40infradead.org@vger.kernel.org Thu May 08 15: 
	26:47 2003
Received: from carisma.slowglass.com ([195.224.96.167](Exim
	4.14 #3 (Red Hat Linux)) id 19DmLq-0006cd-Fh for
	<dwmw2@pentafluge.infradead.org>; Thu, 08 May 2003 15:26:28 +0100
Received: from vger.kernel.org ([209.116.70.75]) by phoenix.infradead.org
	with esmtp (Exim 4.10) id 19DmLx-0002LB-00 for l-k@infradead.org;
	Thu, 08	May 2003 15:26:33 +0100
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
	S261577AbTEHOM3 (ORCPT <rfc822;l-k@infradead.org>); Thu, 8 May 2003
	10:12:29 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org id S261580AbTEHOM3
	(ORCPT <rfc822;linux-kernel-outgoing>); Thu, 8 May 2003 10:12:29 -0400
Received: from [212.59.42.147] ([212.59.42.147]:52566 "EHLO(ORCPT
	<rfc822;linux-kernel@vger.kernel.org>);
	Thu, 8 May 2003 10:12:26 -0400
Received: from keymile.com ([172.26.32.154]) by eurobird.dt.net with
	Microsoft SMTPSVC(5.0.2195.5329); Thu, 8 May 2003 16:24:57 +0200
Message-ID: <3EBA68B9.9000202@keymile.com>
Date: Thu, 08 May 2003 16:24:57 +0200
From: Axel Ludszuweit <alu@keymile.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.1) Gecko/20020826
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
X-OriginalArrivalTime: 08 May 2003 14:24:57.0560 (UTC)
	FILETIME=[99FCB580:01C3156D]
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Subject: helper routines for flash chip probing, search sequence
Content-Type: multipart/mixed; boundary="------------030901030006080801030600"
X-Spam-Status: No, hits=-1.1 required=5.0
	tests=PATCH_UNIFIED_DIFF,QUOTED_EMAIL_TEXT,SPAM_PHRASE_01_02,
	TO_BE_REMOVED_REPLY,UPPERCASE_25_50,USER_AGENT,
	USER_AGENT_MOZILLA_UA,X_ACCEPT_LANG,X_MAILING_LIST version=2.44
X-Spam-Level: 
X-SA-Exim-Scanned: Yes


--------------030901030006080801030600
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I have sent this mail to David Woodhouse, the maintainer 
of MTD (memory technology devices) part. 
He answers 

> At first glance, you seem to be right -- you'll not get false matches
> for 4x interleave when in fact the interleave is 2x, so we should check
> for 4x first. 
>
> Can you send your patch (and explanation) to the mailing list too, so
> that others can comment on it? It's been a while since I've looked hard
> at anything but the CFI probes. Thanks.

And now my original mail:

I have a question, concerning the flash chip helper
routines
      linux/drivers/mtd/chips/gen_probe.c

In my opinion, the searching sequence, to find the
flash geometry, (cfi->device_type and cfi->interleave)
must be reversed, to prevent wrong decisions.
If the buswidth is given, the search should begin 
with the highest meaningfull interleave and the lowest
device type.
With the current searching order I get the following
effect.

I have 4 8bit flashes working on a 32 bit data bus.
The Manufacture ID is 0x89, the Device ID 0xAA.
The flash type is SHARP LH28F016SCT-L95
The correct values, which should be detected are:

- cfi->device_type =  1   CFI_DEVICETYPE_X8
- cfi->interleave  =  4   CFIDEV_INTERLEAVE_4

but the probing detected 

  cfi->interleave  = CFIDEV_INTERLEAVE_2 
  cfi->device_type = CFI_DEVICETYPE_X16.

as valid, so that the test with the correct values, following later,
will not be done.
The identifier codes of this SHARP flashes can be read at offset
0 and 1 after writing 0x90 at any arbitrary address in the flash space.
The unlock sequence 
  0xaa at cfi->addr_unlock1 = 0x555 and 
  0x55 at cfi->addr_unlock2 = 0x2aa
seems not to be neccessary.
The flashes 0 and 2 are unlocked by 0x00900090, flashes 1 and 4 not,
so that 0 and 2 answers with th correct ID and 1 and 3 with 0x00.

If the search order is reversed, the test with the correct values is made
before the test with wrong parameters.

I have attached a patch, which should prevent such wrong decisions, if
the flashes are not correctly designed.

Does anyone know reasons, that the search order should not be reversed?


-- 

--------------------------------------------

Datentechnik GmbH
Axel Ludszuweit
D-30855 Langenhagen

Tel.: +49 511 / 978197-630
Fax : +49 511 / 978197-670
http://www.keymile.com
mailto:axel.ludszuweit@keymile.com

--------------030901030006080801030600
Content-Disposition: inline; filename="patch_gen_probe.c"
Content-Type: text/plain; name=patch_gen_probe.c
Content-Transfer-Encoding: 7bit

--- linux-2.4.20/drivers/mtd/chips/gen_probe.c.orig	Fri Oct  5 00:14:59 2001
+++ linux-2.4.20/drivers/mtd/chips/gen_probe.c	Thu May  8 15:34:52 2003
@@ -159,13 +159,6 @@
 
 #ifdef CFIDEV_BUSWIDTH_2		
 	case CFIDEV_BUSWIDTH_2:
-#ifdef CFIDEV_INTERLEAVE_1
-		cfi->interleave = CFIDEV_INTERLEAVE_1;
-
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_1 */
 #ifdef CFIDEV_INTERLEAVE_2
 		cfi->interleave = CFIDEV_INTERLEAVE_2;
 
@@ -177,50 +170,56 @@
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
 #endif /* CFIDEV_INTERLEAVE_2 */
+#ifdef CFIDEV_INTERLEAVE_1
+		cfi->interleave = CFIDEV_INTERLEAVE_1;
+
+		cfi->device_type = CFI_DEVICETYPE_X16;
+		if (cp->probe_chip(map, 0, NULL, cfi))
+			return 1;
+#endif /* CFIDEV_INTERLEAVE_1 */
 		break;			
-#endif /* CFIDEV_BUSWIDTH_2 */
 
+#endif /* CFIDEV_BUSWIDTH_2 */
 #ifdef CFIDEV_BUSWIDTH_4
 	case CFIDEV_BUSWIDTH_4:
-#if defined(CFIDEV_INTERLEAVE_1) && defined(SOMEONE_ACTUALLY_MAKES_THESE)
-                cfi->interleave = CFIDEV_INTERLEAVE_1;
+#ifdef CFIDEV_INTERLEAVE_4
+		cfi->interleave = CFIDEV_INTERLEAVE_4;
 
-                cfi->device_type = CFI_DEVICETYPE_X32;
+		cfi->device_type = CFI_DEVICETYPE_X8;
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
-#endif /* CFIDEV_INTERLEAVE_1 */
-#ifdef CFIDEV_INTERLEAVE_2
-		cfi->interleave = CFIDEV_INTERLEAVE_2;
 
-#ifdef SOMEONE_ACTUALLY_MAKES_THESE
-		cfi->device_type = CFI_DEVICETYPE_X32;
+		cfi->device_type = CFI_DEVICETYPE_X16;
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
-#endif
-		cfi->device_type = CFI_DEVICETYPE_X16;
+
+#ifdef SOMEONE_ACTUALLY_MAKES_THESE
+		cfi->device_type = CFI_DEVICETYPE_X32;
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
+#endif /* SOMEONE_ACTUALLY_MAKES_THESE */
 
-		cfi->device_type = CFI_DEVICETYPE_X8;
+#endif /* CFIDEV_INTERLEAVE_4 */
+#ifdef CFIDEV_INTERLEAVE_2
+		cfi->interleave = CFIDEV_INTERLEAVE_2;
+
+		cfi->device_type = CFI_DEVICETYPE_X16;
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
-#endif /* CFIDEV_INTERLEAVE_2 */
-#ifdef CFIDEV_INTERLEAVE_4
-		cfi->interleave = CFIDEV_INTERLEAVE_4;
 
 #ifdef SOMEONE_ACTUALLY_MAKES_THESE
 		cfi->device_type = CFI_DEVICETYPE_X32;
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
-#endif
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
+#endif /* SOMEONE_ACTUALLY_MAKES_THESE */
+#endif /* CFIDEV_INTERLEAVE_2 */
+#if defined(CFIDEV_INTERLEAVE_1) && defined(SOMEONE_ACTUALLY_MAKES_THESE)
+                cfi->interleave = CFIDEV_INTERLEAVE_1;
 
-		cfi->device_type = CFI_DEVICETYPE_X8;
+                cfi->device_type = CFI_DEVICETYPE_X32;
 		if (cp->probe_chip(map, 0, NULL, cfi))
 			return 1;
-#endif /* CFIDEV_INTERLEAVE_4 */
+#endif /* CFIDEV_INTERLEAVE_1 */
 		break;
 #endif /* CFIDEV_BUSWIDTH_4 */
 

--------------030901030006080801030600--


--=-MAPxwXj0qidvehaT8Wrq--

--=-MAPxwXj0qidvehaT8Wrq--
