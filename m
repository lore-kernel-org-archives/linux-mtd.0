Received: from [62.249.129.22] (helo=mars.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H5QK-0000aK-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 16:15:40 +0100
Received: from lin01.mn-logistik.de
          (smit-3e365541.pool.mediaWays.net [62.54.85.65]) by mars.iok.net
          (Post.Office MTA v3.5.3 release 223 ID# 127-53822U2500L250S0V35)
          with ESMTP id net for <linux-mtd@lists.infradead.org>;
          Mon, 2 Jul 2001 17:15:43 +0200
Received: from there (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with SMTP id CE683E814
	for <linux-mtd@lists.infradead.org>; Mon,  2 Jul 2001 17:04:01 +0200 (CEST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Holger Schurig <h.schurig@mn-logistik.de>
To: linux-mtd@lists.infradead.org
Subject: jffs2 loop mounting
Date: Mon, 2 Jul 2001 17:04:01 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010702150401.CE683E814@lin01.mn-logistik.de>
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

How difficult would it be for a relatively kernel-newby to add

mount -o loop -t jffs2 /var/tmp/somefile.jffs2 /mnt/jffs2

support?


Or is this all nonsense?  And if it is: how can I get something OUT of 
a JFF2-image?
