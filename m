Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b1GZ-0002rU-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 15:24:15 +0000
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: "Ashok M Padmanaban" <ashokmp@sasken.com>,
        "MTD for Linux" <linux-mtd@lists.infradead.org>,
        "JFFS mailing list" <jffs-dev@axis.com>
Subject: RE: init taking 5sec
Date: Wed, 13 Feb 2002 10:35:49 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKAECPCDAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3C6A9E35.C4B8664F@sasken.com>
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

I'm not sure if creating your own init will dramatically reduce your time.
You'll need to create a custom
optimized init program.  I wouild not bother with the SysVInit 2.78 sources.

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ashok M
Padmanaban
Sent: Wednesday, February 13, 2002 12:11 PM
To: MTD for Linux; JFFS mailing list
Subject: init taking 5sec


Hi All,
Iam  using kernel 2.4.8 (ac12 patch)

partition sizes : 1MB (boot loafder + kernel)
                            13 MB ( cramfs as root file system)
                              2 MB (jffs2 partition)



The kernel boot up till init in 6sec and then init takes 5secs....till
i get the login prompt.
Iam using nicoramdisks init.

Is there any way i can reduce the boot time
Any pointers where i can get the init source file ( version 2.74)

Thanks and regards
ashok



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
