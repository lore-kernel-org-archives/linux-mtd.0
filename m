Received: from outbound-mail.lax.untd.com ([64.136.28.164])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwPqB-0003DR-EC
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 14:07:04 -0500
Received: from outbound29-sr.lax.untd.com (webmail03.lax.untd.com
	[10.131.27.143])
	by smtpout05.lax.untd.com with SMTP id AABBACKETA5YHYZ2
	for <linux-mtd@lists.infradead.org> (sender <pevnev@juno.com>);
	Wed,  2 Feb 2005 11:05:53 -0800 (PST)
Mime-Version: 1.0
From: "Alex" <pevnev@juno.com>
Date: Wed, 2 Feb 2005 19:05:20 GMT
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <20050202.110536.19684.3594@webmail03.lax.untd.com>
Cc: tglx@linutronix.de
Subject: issue with CONFIG_MTD_PHYSMAP_START
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I am totally confused now ...

I have: 

load_kernel after serial_init
loaded at:     00180000 0039C184
relocated to:  00400000 0061C184
board data at: 0061A124 0061A164
relocated to:  004050BC 004050FC
zimage at:     004059ED 004EC1DF
initrd at:     004ED000 006199A1
avail ram:     0061D000 02000000
(So I have 32 Mb RAM)

I tried (in .config) for 2.6.10-rc3
CONFIG_MTD_PHYSMAP_START=0x04000801 (this is higher than RAM address !)

and got:
phys addr 04000000 is RAM !!!!

Anyone could tell me, please, why ?

Thanks,
Alex


___________________________________________________________________
Speed up your surfing with Juno SpeedBand.
Now includes pop-up blocker!
Only $14.95/month -visit http://www.juno.com/surf to sign up today!
