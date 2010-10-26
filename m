Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAcTY-0004wu-Nu
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 05:53:37 +0000
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 225D41C00418
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 07:53:32 +0200 (CEST)
Received: from diddl.denx.de (ppp-88-217-49-37.dynamic.mnet-online.de
	[88.217.49.37])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id DA9A71C001FF
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 07:53:32 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id BCA7B3364F87
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 07:53:32 +0200 (CEST)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id B14FD152451
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 07:53:32 +0200 (CEST)
To: linux-mtd@lists.infradead.org
Subject: UBIFS: mount based on UUID?
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
Date: Tue, 26 Oct 2010 07:53:32 +0200
Message-Id: <20101026055332.B14FD152451@gemini.denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

is there any way to mount UBIFS based on the UUID like we can do for
"normal" file systems, i. e. by using "UUID=..." instead of a device
name in /etc/fstab ?

I see there is a UUID in the file system's super block, but I can't
see it is exposed to any sort of regular user interface.

Am I missing something?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
People with narrow minds usually have broad tongues.
