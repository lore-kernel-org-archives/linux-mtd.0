Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eH9k-0007YW-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 14:21:52 +0100
Message-ID: <39D1F46C.622A1053@auriga.ru>
Date: Wed, 27 Sep 2000 17:21:48 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: jffs-dev <jffs-dev@axis.com>, mtd <mtd@infradead.org>
Subject: Re: Finalized TODO list for NAND and JFFS...
References: <39D1DB9E.D1BAA64E@auriga.ru>  <39D091DC.3218DE2D@cotw.com> <21835.969974378@passion.cygnus.co.uk> <9974.970055852@passion.cygnus.co.uk>
Content-Type: multipart/mixed;
 boundary="------------7934CF72886E1E052A585ADE"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------7934CF72886E1E052A585ADE
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit

Please, find the patch attached.

David Woodhouse wrote:

> nick@auriga.ru said:
> >  By the way, can't we shorten mount time for Intel chips by rewriting
> > read routines in such a way that they don't send Read Status Register
> > command when chip->status is FL_READY?
>
> Yes - well spotted.
>
> nick@auriga.ru said:
> >  So the question, as I can see it, is can we be sure that Status
> > Register has 7th bit set when chip->status == FL_READY?
>
> Yes. If that's ever _not_ the case, then consider it a bug in whatever code
> is setting the state to FL_READY.
>
> Please supply either a SSH public key, so I can give you write access to
> CVS, or a patch that I can apply. The former is probably better.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

--------------7934CF72886E1E052A585ADE
Content-Type: text/plain; charset=koi8-r;
 name="cfi_cmdset0001.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_cmdset0001.patch"

--- cfi_cmdset_0001.c	2000/09/15 14:35:22	1.34
+++ cfi_cmdset_0001.c	2000/09/27 13:17:39
@@ -271,15 +271,18 @@
 		/* Remember the status so we know whether to restart
 		   the erase later */
 		suspendedstate = status;
+		map->write16(map, cpu_to_le16(0x00ff), cmd_addr);
+		chip->state = FL_READY;
 		break;
 #if 0
 	case FL_WRITING:
 		/* Not quite yet */
 #endif
 
+	case FL_READY:
+		break;
 	case FL_CFI_QUERY:
 	case FL_JEDEC_QUERY:
-	case FL_READY:
 		map->write16(map, cpu_to_le16(0x0070), cmd_addr);
 		chip->state = FL_STATUS;
 
@@ -306,6 +309,8 @@
 
 			goto retry;
 		}
+		map->write16(map, cpu_to_le16(0x00ff), cmd_addr);
+		chip->state = FL_READY;
 		break;
 
 	default:
@@ -330,9 +335,6 @@
 		goto retry;
 	}
 
-	map->write16(map, cpu_to_le16(0x00ff), cmd_addr);
-	chip->state = FL_READY;
-
 	map->copy_from(map, buf, adr, len);
 
 	if (suspendedstate) {
@@ -1247,15 +1249,18 @@
 		/* Remember the status so we know whether to restart
 		   the erase later */
 		suspendedstate = status;
+		map->write8(map, 0xff, adr);
+		chip->state = FL_READY;
 		break;
 #if 0
 	case FL_WRITING:
 		/* Not quite yet */
 #endif
 
+	case FL_READY:
+		break;
 	case FL_CFI_QUERY:
 	case FL_JEDEC_QUERY:
-	case FL_READY:
 		map->write8(map, 0x70, adr);
 		chip->state = FL_STATUS;
 
@@ -1282,6 +1287,8 @@
 
 			goto retry;
 		}
+		map->write8(map, 0xff, adr);
+		chip->state = FL_READY;
 		break;
 
 	default:
@@ -1305,9 +1312,6 @@
 
 		goto retry;
 	}
-
-	map->write8(map, 0xff, adr);
-	chip->state = FL_READY;
 
 	map->copy_from(map, buf, adr, len);
 

--------------7934CF72886E1E052A585ADE--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
