Received: from web21104.mail.yahoo.com ([216.136.227.106])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sZWd-0000AC-AB
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 04:02:11 +0100
Message-ID: <20030829030144.91914.qmail@web21104.mail.yahoo.com>
Date: Thu, 28 Aug 2003 20:01:44 -0700 (PDT)
From: Kien Phung Chi <pckien2001@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E19sKVX-0005o4-Uv@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: tdrury@siliconmotorsports.com
Subject: RE: DFORMAT ERROR " IPL block is bad."on DiskOnChip 2000?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I hope that your DOC is not bad
Ypu should try again, use nftlformat from MTD utils:
./nftlformat /dev/mtd0

After that, you can use dformat from DOS to reformat
the DOC.

> ATTACHMENT part 3.1 message/rfc822 
> Date: Wed, 27 Aug 2003 09:42:07 -0400
> From: "Tim Drury" <tdrury@siliconmotorsports.com>
> To: <linux-mtd@lists.infradead.org>
> Subject: RE: DFORMAT ERROR " IPL block is bad."on
> DiskOnChip 2000?
> 
> For the sake of the archives, I'll answer my own
> question.  M-systems
> tech support says my DOC is bad and needs to be
> replaced.
> 
> -tim


=====
Phung Chi Kien
Automation Institute
Hanoi
Vietnam

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
