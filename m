Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Chb9B-0003zB-UZ
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2004 17:09:29 -0500
Received: from dsl-082-083-229-215.arcor-ip.net
	([82.83.229.215]:39557 helo=zappa ident=mail)
	by mail.ku-gbr.de with asmtp (Exim 4.24 #1 (Debian))
	id 1Chb96-0001mp-Vr
	for <linux-mtd@lists.infradead.org>; Thu, 23 Dec 2004 23:09:21 +0100
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1Chb95-00054H-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Dec 2004 23:09:19 +0100
Received: from konsti by sexmachine.doom with local (Exim 4.43)
	id 1Chb94-0002LC-2X
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2004 23:09:18 +0100
Date: Thu, 23 Dec 2004 23:09:18 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20041223220917.GC8918@ku-gbr.de>
References: <20041223145115.GA14940@synertronixx3>
	<Pine.LNX.4.58.0412231717520.4006@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0412231717520.4006@phoenix.infradead.org>
Subject: Re: actual mtd snapshot and jffs3 questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2004-12-23 17:20 +0000 schrieb Artem B. Bityuckiy:

> > Indeed I have no CONFIG_JFFS3_FS_NAND nor CONFIG_JFFS3_FS_NOR_ECC but
> > the code required the members of the struct and compiled fine then.
> That are bugs introduced by newly added summary patch. Hope Ferenc will 
> fix (may be after holydays).

Ok, he should take the time he needs, I will do other work meanwhile :)

> > which is right, no such file :) Forgot cvs add?
> Seems yes...

I forget this (I use svn) always and realize it when compiler breaks
with every new created file :)

> Strange. Will see. JFFS3 should mount JFFS2 images perfectly.

eheee! should :) But nice to have this cleared up...

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
