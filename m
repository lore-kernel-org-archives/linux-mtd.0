Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9PUN-0002Hj-1R
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 10:22:15 -0500
Date: Thu, 10 Mar 2005 16:22:13 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310152212.GB4910@synertronixx3>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 13:15 +0000 schrieb Artem B. Bityuckiy:

> First of all we ask to try the latest MTD snapshot. Did you do that?

I did not but testet now: same picture.
 
> Try to mount empty filesystem then copy your tree there by "cp -r -a", 
> umount, mount. This will exclude errors during JFFS2 image 
> creation/flashing.

The image is dumped from another embedded system running fine
with this image, it was halted and then dumped with the bootloader onto
PC. Its no difference if this image is then flashed or dd'ed

> Try to use mtdram device.

Well if I figure out how to do this and what to do to test I will try.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
