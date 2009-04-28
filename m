Received: from mail-qy0-f108.google.com ([209.85.221.108])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyjZg-0002ZI-RD
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 09:26:48 +0000
Received: by qyk6 with SMTP id 6so1244503qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 02:25:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
References: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
	<Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
Date: Tue, 28 Apr 2009 14:55:56 +0530
Message-ID: <3cc7a0df0904280225w4cc8313dt5b4a3cccbae3fdff@mail.gmail.com>
Subject: Re: Mounting NAND flash as the root file system
From: Gaurav Singh <gausinghnsit@gmail.com>
To: Jatin Sharma <sharmaj@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You can also used the mtd device mtd0 to mount the NAND
mount -t jffs2 mtd0 /mnt. The earlier suggestion is alos correct I
think but for that enable block device access to mtd partitions in
your kernel .config.
