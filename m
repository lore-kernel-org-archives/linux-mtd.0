Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uLT8-0003OU-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 22:44:34 +0100
Received: from mail.ss7-link.com ([209.204.106.218] helo=slink12.ss7-link.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uLSm-0002IO-00
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2001 22:44:12 +0100
Message-ID: <F1BD619B2A58D41197990050DA2C08E40258DE@SLINK12>
From: Jan Rovins <Jan.Rovins@radisys.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: MTD compile on 2.2.17 kernel (compile syntax error)
Date: Mon, 30 Apr 2001 17:44:05 -0400
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

Hi All,

I've been struggling with getting the new source tree to build with my
2.2.17 ppc kernel.
one thing that I am sure of is a typo at line # 211 of cfi_cmdset_0002.c
map->fldrv_destroy should be changed to map->fldrv->destroy .
Could someone with CVS access please fix this?

Thanks

Jan Rovins
