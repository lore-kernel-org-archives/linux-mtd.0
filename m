Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14siL4-0000PY-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 10:45:30 +0100
Received: from moutvdom01.kundenserver.de ([195.20.224.200])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14siL3-0000PS-00
	for mtd@infradead.org; Thu, 26 Apr 2001 10:45:29 +0100
Received: from [195.20.224.209] (helo=mrvdom02.schlund.de)
	by moutvdom01.kundenserver.de with esmtp (Exim 2.12 #2)
	id 14siKp-0003Ih-00
	for mtd@infradead.org; Thu, 26 Apr 2001 11:45:15 +0200
Received: from pd950302c.dip.t-dialin.net ([217.80.48.44] helo=splash.psionic.de)
	by mrvdom02.schlund.de with esmtp (Exim 2.12 #2)
	id 14siKn-0000wT-00
	for mtd@infradead.org; Thu, 26 Apr 2001 11:45:13 +0200
Date: Thu, 26 Apr 2001 11:49:20 +0200
From: Jochen Schaeuble <psionic@psionic.de>
To: mtd@infradead.org
Subject: slram.c modifications
Message-ID: <20010426114920.B1198@psionic.de>
Reply-To: psionic@psionic.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After reading the slram sources I found two things. First of all the

memset(mymtd, 0, sizeof(*mymtd));

In my opinion this is not neccesary because this is done two lines below this
one. The next thing I found is the

memset(mymtd->priv, 0, sizeof(struct mypriv));

If the allocation of the priv field failed above mymtd is set to NULL. If
the priv-field is accessed I guess this would lead to a segmentation fault.

Attached to this mail I send a patch to cover both this issues. I hope this
may be helpfull in some way.

jochen

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="slram.patch"

Index: slram.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/slram.c,v
retrieving revision 1.14
diff -u -r1.14 slram.c
--- slram.c	2001/01/11 15:17:42	1.14
+++ slram.c	2001/04/26 09:38:41
@@ -156,8 +156,6 @@
 
 	mymtd = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
 	
-	memset(mymtd, 0, sizeof(*mymtd));
-	
 	if (mymtd)
 	{
 		memset((char *)mymtd, 0, sizeof(struct mtd_info));
@@ -166,8 +164,9 @@
 		{
 			kfree(mymtd);
 			mymtd = NULL;
+		} else {
+			memset(mymtd->priv, 0, sizeof(struct mypriv));
 		}
-		memset(mymtd->priv, 0, sizeof(struct mypriv));
 	}
 
 	if (!mymtd)

--ZGiS0Q5IWpPtfppv--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
