Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSiBx-0001RP-Sp
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 09:00:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by bastet.se.axis.com (Postfix) with ESMTP id B06F318245
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 11:00:29 +0200 (CEST)
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Oje+zHa7fDx4 for <linux-mtd@lists.infradead.org>;
 Fri, 21 Aug 2015 11:00:29 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by bastet.se.axis.com (Postfix) with ESMTP id 2C6D51820C
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 11:00:29 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id 1509B14EB
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 11:00:29 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by boulder.se.axis.com (Postfix) with ESMTP id 09B71FEC
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 11:00:29 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
 by seth.se.axis.com (Postfix) with ESMTP id 05CD93E049
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 11:00:29 +0200 (CEST)
Date: Fri, 21 Aug 2015 11:00:28 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 vs. UBIFS compression
Message-ID: <alpine.DEB.2.02.1508211046210.10202@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I came across something odd that I wasn't really expecting the other day.

On a JFFS2 file system, we have a file that is 12.25 MB in size. When 
written to an 8 MB partition, df reports that it occupies 5.9 MB. Writing 
a second copy of the file fails because the file system is full. Fair 
enough.

On a similar UBIFS system (however in this case with a volume size of 32 
MB), the same file is reported by df to have occupied 7.9 MB. Writing 
multiple copies of the same file confirms that we can fit slightly more 
than 4 copies of the same file on the file system (32 MB / 7.9 MB yields 
4.05), so 7.9 MB seems about right.

Now I fully understand that getting df to report valid figures for 
compressed file systems is guesswork at best, but don't JFFS2 and UBIFS 
utilize the same compression algorithms? Consequently, the space used by 
especially large files (where the overhead is small) should be essentially 
the same for both file systems? If anything, one would expect that UBIFS, 
being newer, would better at compression than JFFS2.

So what are we seeing here, is UBIFS more conservative in reporting disk 
usage, or is JFFS2 really better than UBIFS at file compression?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
