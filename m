Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zy2u-0007ZE-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 19:18:04 +0100
Message-ID: <2702075D4DE2B043BF5EB82E9CFAD45B09E68E@mail1.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Memory leak problem with JFFS2 
Date: Wed, 31 Jul 2002 14:18:00 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Yes, this happens in the CVS code.  I did not try with the jffs2-2_4-branch
( why I understand is the one into kernel 2.4.19-rc2 ? ).

|-----Original Message-----
|From: David Woodhouse [mailto:dwmw2@infradead.org]
|Sent: Wednesday, July 31, 2002 2:05 PM
|To: Frederic Giasson
|Cc: linux-mtd@lists.infradead.org
|Subject: Re: Memory leak problem with JFFS2 
|
|
|
|fgiasson@mediatrix.com said:
|> You have the right procedure to reproduce the problem ( 
|vmstat ; while
|> true ; do mount -t jffs2 mtd0 /mnt/spare ; ).  I can reproduce the
|> problem using this line on my system.
|
|> I updated my JFFS2 code with the lastest from CVS, and I am using
|> kernel 2.4.19-rc2, and the problem is still there.  Do you think you
|> could do the same test under 2.4.19-rc2?
|
|I'll have a go. This happens in the CVS code, not the jffs2-2_4-branch 
|code, right?
|
|--
|dwmw2
|
|
|
