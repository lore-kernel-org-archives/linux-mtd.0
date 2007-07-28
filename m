Received: from wx-out-0506.google.com ([66.249.82.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IEhLG-00019G-RB
	for linux-mtd@lists.infradead.org; Sat, 28 Jul 2007 04:08:03 -0400
Received: by wx-out-0506.google.com with SMTP id s7so950619wxc
	for <linux-mtd@lists.infradead.org>;
	Sat, 28 Jul 2007 01:08:01 -0700 (PDT)
Message-ID: <e1d5030b0707280108v236cc522m454c58e1044f1996@mail.gmail.com>
Date: Sat, 28 Jul 2007 13:38:01 +0530
From: "Midhun A" <midhunagni@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd@lists.infradead.org
Subject: Testing of CPRM on SD Card
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

Hi All,

    Our product development requires that we use the CPRM security
feature of SD card for protecting our material. I have been searching
the web for a SD host controller / Software which is CPRM capable, so
that we can write/read an encrypted SD card with the testing keys
provided by the 4C Entity) and test our prototype. But I could find
none. There are IP cores but no manufactured chips.

   Has anybody of you done similar stuff ? How do I go about testing
the CPRM feature of the SD card on our prototype ?

Thanks,
Midhun.
