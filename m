Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Qy1s-00077m-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 21:55:32 +0000
Message-ID: <3C45F8D3.936BDC25@comdev.cc>
Date: Wed, 16 Jan 2002 14:04:03 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: different crash (was Re: JFFS2 is crashing the kernel)
References: <19201.1011213161@redhat.com>  <3C45DC51.599F4E7B@comdev.cc> <20020116163239.99399.qmail@web13206.mail.yahoo.com> <8630.1011205354@redhat.com> <19249.1011213352@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> What version of build.c?

[awozniak@rangers jffs2]$ grep Id: *.[ch]
background.c: * $Id: background.c,v 1.16 2001/10/08 09:22:38 dwmw2 Exp $
build.c: * $Id: build.c,v 1.22 2002/01/09 16:30:57 dwmw2 Exp $
compr.c: * $Id: compr.c,v 1.22 2002/01/11 10:10:49 dwmw2 Exp $
compr_rtime.c: * $Id: compr_rtime.c,v 1.7 2002/01/09 13:25:57 dwmw2 Exp
$
compr_rubin.c: * $Id: compr_rubin.c,v 1.15 2002/01/09 13:25:57 dwmw2 Exp
$
compr_rubin.h:/* $Id: compr_rubin.h,v 1.5 2001/02/26 13:50:01 dwmw2 Exp
$ */
comprtest.c:/* $Id: comprtest.c,v 1.5 2002/01/03 15:20:44 dwmw2 Exp $ */
compr_zlib.c: * $Id: compr_zlib.c,v 1.11 2002/01/11 10:10:49 dwmw2 Exp $
crc32.c:/* $Id: crc32.c,v 1.4 2002/01/03 15:20:44 dwmw2 Exp $ */
crc32.h:/* $Id: crc32.h,v 1.4 2002/01/03 15:20:44 dwmw2 Exp $ */
dir.c: * $Id: dir.c,v 1.51 2002/01/13 22:11:00 dwmw2 Exp $
erase.c: * $Id: erase.c,v 1.30 2002/01/09 13:25:57 dwmw2 Exp $
file.c: * $Id: file.c,v 1.63 2002/01/07 11:18:05 dwmw2 Exp $
gc.c: * $Id: gc.c,v 1.58 2002/01/09 13:25:57 dwmw2 Exp $
ioctl.c: * $Id: ioctl.c,v 1.5 2001/03/15 15:38:24 dwmw2 Exp $
malloc.c: * $Id: malloc.c,v 1.18 2002/01/09 13:25:57 dwmw2 Exp $
nodelist.c: * $Id: nodelist.c,v 1.36 2002/01/09 16:52:59 dwmw2 Exp $
nodelist.h: * $Id: nodelist.h,v 1.59 2002/01/10 09:29:53 dwmw2 Exp $
nodemgmt.c: * $Id: nodemgmt.c,v 1.51 2002/01/09 13:25:58 dwmw2 Exp $
os-linux.h: * $Id: os-linux.h,v 1.3 2002/01/09 13:00:08 dwmw2 Exp $
pushpull.c: * $Id: pushpull.c,v 1.9 2002/01/09 13:25:58 dwmw2 Exp $
pushpull.h: * $Id: pushpull.h,v 1.5 2001/09/23 10:04:15 rmk Exp $
read.c: * $Id: read.c,v 1.19 2002/01/14 23:30:26 dwmw2 Exp $
readinode.c: * $Id: readinode.c,v 1.64 2002/01/09 13:25:58 dwmw2 Exp $
scan.c: * $Id: scan.c,v 1.57 2002/01/09 13:25:58 dwmw2 Exp $
super.c: * $Id: super.c,v 1.50 2002/01/09 13:25:58 dwmw2 Exp $
symlink.c: * $Id: symlink.c,v 1.9 2002/01/10 09:29:53 dwmw2 Exp $
write.c: * $Id: write.c,v 1.38 2002/01/09 13:25:58 dwmw2 Exp $
zlib.c: * $Id: zlib.c,v 1.3 1997/12/23 10:47:42 paulus Exp $
zlib.h:/*       $Id: zlib.h,v 1.2 1997/12/23 10:47:44 paulus Exp $     
*/

-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
