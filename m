Received: from [216.187.71.220] (helo=shelbrook.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175rMi-0007mD-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 18:06:04 +0100
From: "Darren Martz" <dmartz@shelbrook.com>
To: "'Russ Dill'" <Russ.Dill@asu.edu>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Boot from DoC2000
Date: Thu, 9 May 2002 10:06:01 -0700
Message-ID: <002c01c1f77b$cc059300$9702a8c0@maverick>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1020959648.30841.3590.camel@russ>
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

Russ,

Thanks for the clarification, I didn't realize that JFFS/2 was the only
unstable part. Being new to this, I'm trying to stick to as few patches
as possible. I'll look into grub with nftl.

Darren

> look at the mailing list archives, grub works great on a DOC. jffs2
(or
> jffs) is not ready for use on a DOC, but its close, so you'd have to
use a standard filesystem on top of NFTL.

> actually, syslinux works fine with the original m-sys "firmware"
