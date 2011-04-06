Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7XLw-0000fG-R8
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2011 18:21:17 +0000
Received: by pvh11 with SMTP id 11so770358pvh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2011 11:21:14 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 Apr 2011 11:21:14 -0700
Message-ID: <BANLkTimFQH2K-gxvHzcKaDU4Xv4zDHHO6g@mail.gmail.com>
Subject: Creating a panic_write() for the common flash interface driver
From: Rick Ramstetter <rick.ramstetter@gmail.com>
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

Hi all,

I would like to use the mtdoops module to record kernel panics.
Unfortunately, the common flash interface driver doesn't define a
panic_write() function in struct mtd_info. Thus, the mtdoops driver is
unable to write to flash from kernel panic context.

Has anyone attempted to (or successfully) implemented such a
panic_write() function for AMD compatible (cfi_cmdset_0002.c) CFI
chips before? Care to share any relevant pointers or potential
pitfalls?

If there is a more appropriate mailing list to ask this question on,
please share relevant information about.

Thank you,
--Rick.
