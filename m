Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L3EAE-0005Ml-0S
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 18:22:02 +0000
Received: by fg-out-1718.google.com with SMTP id l26so432296fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Nov 2008 10:21:59 -0800 (PST)
Message-ID: <8fbbfb6b0811201021l3f3d9aabr90d9c54b18555cfc@mail.gmail.com>
Date: Thu, 20 Nov 2008 23:51:59 +0530
From: "Ankur Maheshwari" <ankur.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org, ankur_maheshwari@in.com
Subject: Query on UBIFS usage
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am newbee to UBIFS. I have some basic doubts on using UBIFS.

1. I read in UBIFS FAQ that it can not be used as NFS file system. I
am bit confuse with the statement.
Is it possible that I use UBIFS on one of Flash partition and at the
same time do NFS (root fs mount as NFS) boot. Is there any issue with
it.

2. Can I use UBIFS with other Flash filesystem (like SquashFS-read
only) on other partition of same flash.

3. What will be better, keep using SquashFS(RO) or switch to UBIFS.

Thanks in advance.

-ANM
