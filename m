Received: from [210.80.78.61] (helo=serversw.iei.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VTXD-0006mK-H8
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 10:59:21 +0100
Received: from serversw.iei.com.tw (root@localhost)
	by serversw.iei.com.tw with ESMTP id h5Q9qqt25486
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jun 2003 17:52:52 +0800 (CST)
Received: from antivirusgw.hq.iei ([172.16.2.30])
	by serversw.iei.com.tw with SMTP id h5Q9qqI25482
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jun 2003 17:52:52 +0800 (CST)
Received: (from kevinliao [172.16.10.95])
 by antivirusgw.hq.iei (NAVGW 2.5.1.19) with SMTP id M2003062617573628937
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 17:57:36 +0800
Message-ID: <004001c33bc9$a1b40260$5f0a10ac@kevinliao>
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: <linux-mtd@lists.infradead.org>
References: <00fd01c33b07$948945e0$5f0a10ac@kevinliao>
Date: Thu, 26 Jun 2003 17:59:28 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 warning message
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does anyone have any idea about this problem? Thanks a lot.

Regards,
Kevin

----- Original Message ----- 
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, June 25, 2003 6:50 PM
Subject: JFFS2 warning message


> Dear all,
> 
> I had a mtd partition on NAND flash mounted as JFFS2. If the power was shutdown abnormally, after that each time when the system
> rebooted and tried to mount it again, I always saw a warning message "Empty flash at 0x00000a14 ends at 0x00000c00". Although I
> finally found that message was printed by jffs2_scan_eraseblock function in jffs2/scan.c, I still had no idea about what's really
> happened. Does anyone could explain the reason about that warning message or tell me what should I do to avoid the kernel's
> complaint? Thanks a lot.
> 
> Regards,
> Kevin
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
