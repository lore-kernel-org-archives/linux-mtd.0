Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfekQ-0005ka-4F
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 18:58:34 +0000
Received: by ywh13 with SMTP id 13so3056619ywh.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Aug 2009 11:58:28 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 24 Aug 2009 11:58:28 -0700
Message-ID: <c260b4940908241158m5565f682ped4a908c6998cef8@mail.gmail.com>
Subject: Write to NOR flash garbled
From: N Cheung <brjerome.1@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This device, a Micrel KS8695 based system with Linux 2.6.18 with AMD
Am29LV641DH.  Device running find for 2 years until switch to a
compatible Spansion NOR flash S29GL064N.

flashcp failed with error: File does not seem to match flash data.
First mismatch at 0x00000000-0x00002800

Use dd to copy a one line text file, we can read it back OK.  But with
a bigger (200 lines) text file, the data get garbled.

However, if MTD debug is set to verbosity=3, flashcp copied big files
without problem.

Any pointers will be greatly appreciated.

Thanks in advance,
Norman
