Received: from mail.spectracomcorp.com ([64.65.245.202]
	helo=nexserver.spectracomcorp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6ahC-0003wN-L4
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 19:39:18 +0000
Received: (from root@localhost)
	by nexserver.spectracomcorp.com (8.11.6/8.11.6) id i2PJdEJ19887
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 14:39:14 -0500
Received: from CoOp4 ([10.10.200.196])i2PJdBJ19813
	for <linux-mtd@lists.infradead.org>; Thu, 25 Mar 2004 14:39:12 -0500
Message-ID: <029e01c412a0$daaf5ed0$c4c80a0a@CoOp4>
From: "Eric Hammerle" <ehammerle@spectracomcorp.com>
To: <linux-mtd@lists.infradead.org>
References: <OF6499D9FD.A5006680-ON85256E62.00682789-85256E62.0068A11B@ca-chq.celestica.com>
Date: Thu, 25 Mar 2004 14:39:14 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: 
	Re: Unable to handle kernel paging request at virtualaddress80000013
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi Eric, I run into the same problem as you had, but my system is much
> simplier.

I'm not sure which Eric you're referring to, but if it's any help, I fixed
my
alignment problem by forcing a four byte alignment of the name field in
the definition of the struct jffs2_full_dirent in file nodelist.h.

I suppose a diff would look something like this:

- unsigned char name[0];
+ unsigned char name[0] __attribute__ ((align(4)));

I'm not sure if this is the recommended fix for the alignment issues, but it
worked for me.

If, of course, you were referring to the other Eric on this board, ignore
this
post, but anyone with an ARM7TDMI might want to look this way.

-E
