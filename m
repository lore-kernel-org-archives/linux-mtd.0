Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZubc-0002P0-3C
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2004 12:19:01 -0500
Received: from atlas.denx.de (atlas.denx.de [10.0.0.14])
	by denx.de (Postfix) with ESMTP id 8942E42A5B
	for <linux-mtd@lists.infradead.org>;
	Thu,  2 Dec 2004 18:18:23 +0100 (MET)
Received: from atlas.denx.de (localhost [127.0.0.1])
	by atlas.denx.de (Postfix) with ESMTP id 011DC13D6DB
	for <linux-mtd@lists.infradead.org>;
	Thu,  2 Dec 2004 18:18:22 +0100 (MET)
To: linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Thu, 02 Dec 2004 19:31:05 +0300."
	<200412021931.05132.skorinkod@mosk.ru>
Date: Thu, 02 Dec 2004 18:18:17 +0100
Sender: wd@denx.de
Message-Id: <20041202171822.02019C1430@atlas.denx.de>
Subject: Re: Booting from DiskOnChip 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <200412021931.05132.skorinkod@mosk.ru> you wrote:
> 
> As I understand there are two ways for booting from DiskOnChip (correct me, if 
> I think wrong):

This depends on your hardware and the capabilities of your boot loader.

> 1) use patched lilo from M-System site
> 2) use patched grub from mtd cvs

3) Use U-Boot from U-Boot CVS.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
As far as we know, our computer has never had an undetected error.
		                                           -- Weisert
