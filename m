Received: from imo-m03.mx.aol.com ([64.12.136.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uU8x-0005LL-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 09:37:07 +0100
Received: from Kschoo70C@netscape.net
	by imo-m03.mx.aol.com (mail_out_v34.10.) id 3.5d.451ab85 (22681)
	 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 04:36:30 -0400 (EDT)
Date: Thu, 26 Sep 2002 04:38:47 -0400
From: Kschoo70C@netscape.net
To: linux-mtd@lists.infradead.org
Subject: Question about power fail during file upgrade
Message-ID: <19E00413.60CCAB38.0265FBE9@netscape.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Hi,
    I need some help to understand how the JFFS2 works. If I have a version 1 of software component A on JFFS2, what happen if power failed while I am in the middle of upgrading the component A to version 2 ? The question is do I have version 1 intact or a combination of version 1 and 2 ?

Does the JFFS2 filesystem only set the inodes of a file to be valid only after a complete file is written to the flash ?
Does the old file will only be deleted only after the new file is verified to be valid ?

Thanks in advanced.

regards
choo
    

__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/
