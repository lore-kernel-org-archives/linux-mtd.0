Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUoIq-0007Fd-6T
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 23:06:16 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUoIk-0002pu-Nb
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2011 01:06:10 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2011 01:06:10 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2011 01:06:10 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Fri, 10 Jun 2011 01:05:56 +0200
Message-ID: <66k2v6hfdbhcd6onjr6binvhpujidimja0@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<ics1v6h6c3h777js8uh4j8bve2i1q7m5d0@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 09 Jun 2011 18:17:24 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>Now that I can successfully format + attach + mount the Ubifs NAND
>partition, I tried rebooting with the following kernel command line:
>
>==========
>bootargs=ethaddr=00:09:45:56:72:9b console=ttyBF0,115200
>rootfstype=ubifs ubi.mtd2 root=ubi0:rootfs
>==========

Even after correcting the mistake above ("ubi.mtd2" should be
"ubi=mtd2"), uClinux still can't access Ubifs on mtd2 and crashes.

I double-checked that the kernel has MTD + UBI + Ubifs compiled
statically.

Incidently, are those settings in "bootargs" enough to have the kernel
run the equivalent of ubiattach with the right commands for Ubi(fs)
before attempting to mount the NAND partition as root filesystem?
