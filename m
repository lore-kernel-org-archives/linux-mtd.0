Received: from mail-bw0-f66.google.com ([209.85.214.66])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVVB6-0003Gt-He
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2010 20:20:53 +0000
Received: by bwz7 with SMTP id 7so2225844bwz.1
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 12:20:50 -0800 (PST)
Subject: Re: UBIFS reboots issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Boaz Ben-David <boaz.bd@wellsense-tech.com>
In-Reply-To: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Dec 2010 22:20:45 +0200
Message-ID: <1293049245.2051.4.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-22 at 16:36 +0200, Boaz Ben-David wrote:
> Hi all,
> 
> We have an embedded system using a Samsung 2GB MLC NAND and are using
> UBIFS as the file system on it.
> I have a question regarding UBIFS and hard reboots.
> After some work with the flash (doing reads and writes to it), some
> times one of our partitions would fail to mount.
> I suspected this has something to do with a reboot which happens during
> a write to the flash.
> In order to test this I created a simple script which copies a file from
> to the partition, syncs, then deletes it and does this repeatedly until 
> a hard reboot occurs (using the watch dog to cause the boot).
> This process repeats itself until the partition fails to mount.
> When I performed the test mentioned above, after about 3-4 times the
> partition would fail.
> I am not sure if this behaviour is normal or not.
> Did someone encounter similiar behaviour?

Just curious, did you see this:

http://linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

I do not think you can just use UBI/UBIFS on MLC as is, you'd need to
make sure MLC-specific behavior is handled properly.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
