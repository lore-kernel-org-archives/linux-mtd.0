Received: from noc.mainstreet.net ([207.5.0.45])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AhJ2t-0007Ld-N6
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2004 01:45:11 +0000
Received: from mail.idt.com (mail.idt.com [157.165.5.20])
	by noc.mainstreet.net (8.12.10/8.12.10) with ESMTP id i0G1h02W081207
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jan 2004 17:43:00 -0800 (PST)
Received: from corpml1.corp.idt.com (firewall-user@supercop4.idt.com
	[157.165.5.10])	by mail.idt.com (8.9.3/8.9.3) with ESMTP id RAA07915
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jan 2004 17:44:01 -0800 (PST)
Received: from CORPBRIDGE.corp.idt.com (corpexchange1.corp.idt.com
	[157.165.140.83])i0G1h0f22776	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jan 2004 17:43:00 -0800 (PST)
Message-ID: <73943A6B3BEAA1468EE1A4A090129F4339809F@corpbridge.corp.idt.com>
From: "Kou, Haofeng" <Haofeng.Kou@idt.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 15 Jan 2004 17:42:57 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: drive SST 39SF040 flash chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do you have the solution for this problem?
I meet the same situation again.

Thanks!


----------------------------------------------------------------------------
----
drive SST 39SF040 flash chip
rain.wang rain.wang at mic.com.tw 
Thu Oct 24 16:06:08 BST 2002 

Previous message: unble to mount rootfilesystem from cramfs 
Next message: does mtd support both toshiba and samsung 128MBytes (1GBits)
nand flash? 
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ] 

Hi,
It seems the 39SF040 commands don't work with jede.c, I'm not familiar
with JEDEC standards yet, does there need a new chip driver for 39SFxx
beside current jedec.c?

regards
rain.w
