Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uHHp-0002cm-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 18:16:37 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uHEk-0000nO-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 18:13:26 +0100
Received: from topaz.3com.com ([192.156.136.158])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14uHEj-0000nH-00
	for mtd@infradead.org; Mon, 30 Apr 2001 18:13:25 +0100
Received: from opal.3com.com (opal.3com.com [139.87.50.117])
	by topaz.3com.com (Switch-2.1.0/Switch-2.1.0) with ESMTP id f3UHB4f14506
	for <mtd@infradead.org>; Mon, 30 Apr 2001 10:11:04 -0700 (PDT)
Received: from hqoutbound.ops.3com.com (hqoutbound.ops.3com.com [139.87.48.104])
	by opal.3com.com (Switch-2.1.0/Switch-2.1.0) with SMTP id f3UHCku13559
	for <mtd@infradead.org>; Mon, 30 Apr 2001 10:12:46 -0700 (PDT)
From: Chester_Szczepucha@3com.com
To: mtd@infradead.org
Message-ID: <88256A3E.005E5B71.00@hqoutbound.ops.3com.com>
Date: Mon, 30 Apr 2001 10:12:27 -0700
Subject: physmap driver problem and possible fix
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
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



Guys,

I've got 16-bit AMD flash connected to PPC.
Some command are generated as writes to XXXXX555.
Due to such an address I get alignment errors.
If I remove LSB in physmap_write16, ie.
adr &= 0xfffffffe;
things start working.

Do you think this should go to physmap or somewhere else?

Chester




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
