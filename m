Received: from py-out-1112.google.com ([64.233.166.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEV7E-0000c7-73
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 19:37:00 +0000
Received: by py-out-1112.google.com with SMTP id p76so3915562pyb.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jan 2008 11:33:05 -0800 (PST)
Date: Mon, 14 Jan 2008 07:00:49 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Naveen Sattigeri <naveen_j_s@yahoo.com>
Subject: Re:
Message-ID: <20080114070049.12f34137@vader.jdub.homelinux.org>
In-Reply-To: <660898.91474.qm@web32812.mail.mud.yahoo.com>
References: <660898.91474.qm@web32812.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Linux <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 13 Jan 2008 23:32:47 -0800 (PST)
Naveen Sattigeri <naveen_j_s@yahoo.com> wrote:

> Please correct if I am wrong.The kernel 2.6.10 should
> be patched for latest NAND mtd drivers.
> I have tried the latest patch 2008-January.txt but it
> was not successful because probably the patch is for
> latest kernel.
> Can I get the patch for 2.6.20?

http://linux-mtd.infradead.org/source.html#kernelversions

> What else I should do to detect the compact flash as
> MTD device using a host or using NFS.

You can't.  Compact flash is not real flash, nor does it have an
interface to present the real flash.

http://linux-mtd.infradead.org/faq/jffs2.html#L_stick_jffs2

josh
