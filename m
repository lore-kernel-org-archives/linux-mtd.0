Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9Xe9-0006pT-Vx
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 19:04:54 -0500
Received: from dsl-213-023-243-193.arcor-ip.net
	([213.23.243.193]:33208 helo=zappa ident=mail)
	by mail.ku-gbr.de with asmtp (Exim 4.24 #1 (Debian))
	id 1D9Xe7-0001Yh-FJ
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 01:04:51 +0100
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1D9Xe6-0003eR-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 01:04:50 +0100
Received: from konsti by sexmachine.doom with local (Exim 4.43)
	id 1D9Xe5-0002fQ-FY
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 01:04:49 +0100
Resent-Message-ID: <20050311000449.GD10058@ku-gbr.de>
Date: Fri, 11 Mar 2005 00:18:51 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20050310231850.GA10058@ku-gbr.de>
References: <20050310164848.GB7018@synertronixx3>
	<JPEALJAFNGDDLOPNDIEECEJFDBAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JPEALJAFNGDDLOPNDIEECEJFDBAA.joakim.tjernlund@lumentis.se>
Cc: 
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 18:01 +0100 schrieb Joakim Tjernlund:

> I think there is old data/garbage in the CPU:s cache thats causing your problem.
> Do you invalidate the data cache before you burst copy data from flash?

I drunk a couple of beer after several hours of hacking onto this and I
think in the same direction as you at the moument.
If you followed the thread in the mailing list you see my debugging
printk effords, which show that memcpy() reads the wrong line after page
boundary to the next line.
I thought first that page wrap mode of sync burst mode is freaking out,
but source and destiantion of memcpy() is in RAM.

So DataCache is the problem to check up. I don't know yet if _I_
invalidate cache before bursting. I should... or jffs2 or mtd-tools...

May I copy this mail into the ml, since you addressed me without it?

> Whats your CPU?

Motorla ARM9 core implemented on their i.MX architecture.

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
