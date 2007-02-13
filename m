Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGvT4-0003ph-36
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 11:05:06 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HGvBT-0001Cn-MW
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 11:46:51 +0100
Received: from 40.107.210.62.te-dns.org ([62.210.107.40])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 11:46:51 +0100
Received: from matthieu.castet by 40.107.210.62.te-dns.org with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 11:46:51 +0100
To: linux-mtd@lists.infradead.org
From: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: Re: PATCH: calculate s3c2410 NAND timing values more accurately
Date: Tue, 13 Feb 2007 10:46:40 +0000 (UTC)
Message-ID: <loom.20070213T114255-129@post.gmane.org>
References: <f383264b0702121139w7b5dc50ds8bdd96b708c1336d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Matt Reimer <mattjreimer <at> gmail.com> writes:

> 
> Calculate NAND timing values more accurately on S3C2410, 2412, and
> 2440, whose registers differ slightly:
> 
> Enforce the TACLS max value as 3 on 2440 but 7 on 2410/2412.
> 
> Also, make it possible to specify a value of 0 on 2412/2440.
> 

If you remove the "if (result < 1) result = 1;" check in s3c_nand_calc_rate, I
believe you should check for twrph0 or twrph1 equal 0 in s3c2410_nand_inithw (ie
if (tacls < 0 || twrph0 <= 0 || twrph1 <= 0) { return error).

Matthieu
