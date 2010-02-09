Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ner9u-00046b-TZ
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 14:33:51 +0000
Received: by ey-out-1920.google.com with SMTP id 3so986803eyh.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Feb 2010 06:33:45 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 9 Feb 2010 09:33:45 -0500
Message-ID: <dbdb2ea61002090633h770779a5gfa640a3fd6112c22@mail.gmail.com>
Subject: noatime and nodiratime for ubifs mounting
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

To minimize unnecessary writes to UBIFS, does it make sense to mount
with the noatime and nodiratime flags?  Some information I've read
suggests that this helps minimize writes and is beneficial to
flash-based filesystems.  Is there any downside to using these flags?

Thanks,
twebb
