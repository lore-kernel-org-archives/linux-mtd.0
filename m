Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw24a-0000TM-UN
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 12:44:22 -0500
Date: Tue, 1 Feb 2005 18:44:20 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050201174419.GA32581@synertronixx3>
References: <20050201153945.GA26068@synertronixx3>
	<Pine.LNX.4.61.0502011137020.31479@localhost.localdomain>
	<20050201172059.GB26068@synertronixx3>
	<Pine.LNX.4.61.0502011229310.31479@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0502011229310.31479@localhost.localdomain>
Subject: Re: I need still help with XIP, kernel boots now :)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Regarding my mail before:

I changed IMX_TCN(1) to IMX_TCN(0) because this is the system timer,
damn! Oops is away then and booting an non xip uImage with
CONFIG_XIP_MTD=y works very well! I could copy a file onto the extra
partition mounted rw. 

Running this xipuImage (/ mounted ro) allowed me to mount 
an extra jffs2 partition and ls on it, but writing on it freezes the
system.

Am 2005-02-01 12:30 -0500 schrieb Nicolas Pitre:

> What kernel version is this?

2.6.11-rc2-mm2 with my board specific i.MX addons.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
