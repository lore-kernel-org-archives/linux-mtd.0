Received: from allen.werkleitz.de ([80.190.251.108])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EnJJl-0007V0-MC
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 17:24:30 +0000
Received: from p54bea8c6.dip0.t-ipconnect.de ([84.190.168.198] helo=void.local)
	by allen.werkleitz.de with esmtpsa
	(TLS-1.0:DHE_RSA_3DES_EDE_CBC_SHA1:24) (Exim 4.60)
	(envelope-from <js@linuxtv.org>) id 1EnJJR-0000MP-8Z
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 18:24:14 +0100
Received: from js by void.local with local (Exim 3.35 #1 (Debian))
	id 1EnJJP-0002hy-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Dec 2005 18:24:07 +0100
Date: Fri, 16 Dec 2005 18:24:07 +0100
From: Johannes Stezenbach <js@linuxtv.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051216172407.GA6953@linuxtv.org>
References: <20051214142512.GA10310@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051214142512.GA10310@linuxtv.org>
Subject: Re: Fix mounting jffs2 by mtd name
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 14, 2005, Johannes Stezenbach wrote:
> Busybox mount insists that mtd: refers to a NFS mount:
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 02000000 00004000 "foo"
> # mount mtd:foo /mnt -t jffs2
> mount: mtd: Unknown host
> mount: nfsmount failed: Connection refused
> mount: Mounting mtd:foo on /mnt failed: Invalid argument
> 
> I suggest new syntax:
> 
> # mount mtd/foo /mnt -t jffs2

OK, I found out this was a bug in the specific version
of busybox mount in use here. Up-to-date busybox and
util-linux mount seem to be fine.

Silly idea to fix this in the kernel ;-/

Sorry for the noise,
Johannes
