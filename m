Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjEQr-0000DM-1r
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2010 16:45:37 +0000
Received: by wyb34 with SMTP id 34so374901wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Aug 2010 09:45:34 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 11 Aug 2010 12:45:34 -0400
Message-ID: <AANLkTim32XFn_Dsk8NdLwTX1aXwdjN4UVQA1xhWvLJLQ@mail.gmail.com>
Subject: wiping a UBIFS volume
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to delete everything in a UBIFS volume and leave as little
as possible behind to prevent any malicious use of "deleted" files.
Is there any significant difference between simply removing all the
files on a UBIFS volume versus using "upiupdatevol /dev/ubi0_0 -t"?
Is there a preferred way to accomplish this for a UBIFS volume?

Thanks,
twebb
