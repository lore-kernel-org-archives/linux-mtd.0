Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CVYCe-0007XH-LW
	for linux-mtd@lists.infradead.org; Sat, 20 Nov 2004 11:35:13 -0500
Received: from dsl-213-023-233-073.arcor-ip.net
	([213.23.233.73]:33103 helo=zappa ident=mail)
	by mail.ku-gbr.de with asmtp (Exim 4.24 #1 (Debian))
	id 1CVYCc-0008Vm-A3
	for <linux-mtd@lists.infradead.org>; Sat, 20 Nov 2004 17:35:10 +0100
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1CVYCb-0002RM-00
	for <linux-mtd@lists.infradead.org>; Sat, 20 Nov 2004 17:35:09 +0100
Received: from konsti by sexmachine.doom with local (Exim 4.43)
	id 1CVYCc-00025p-9e
	for linux-mtd@lists.infradead.org; Sat, 20 Nov 2004 17:35:10 +0100
Date: Sat, 20 Nov 2004 17:35:10 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20041120163510.GD7984@ku-gbr.de>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1100962661.8600.41.camel@localhost.localdomain>
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2004-11-20 14:57 +0000 schrieb David Woodhouse:
> On Sat, 2004-11-20 at 15:50 +0100, Konstantin Kletschke wrote:
> > No, that does not help. I replaced my disabling #defines by the
> > lock<->unlcocp pair, no avail:
> 
> Hm, OK. I don't think the other patch is likely to fix it either then.
> I'll take another look.

Sadly I overlooked your other (cvs comitted) patch this evening and I am
at home now, what a pity... That would have cleared the situation up in
5 minutes :/

K

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
