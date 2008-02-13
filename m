Received: from hs-out-0708.google.com ([64.233.178.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPHs0-0008WH-GJ
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 13:41:58 +0000
Received: by hs-out-0708.google.com with SMTP id 55so15192hsc.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Feb 2008 05:41:51 -0800 (PST)
Message-ID: <c384c5ea0802130541i160a3888pac00f2cdc37222ed@mail.gmail.com>
Date: Wed, 13 Feb 2008 14:41:50 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: What part of the code puts CFI Flash into write-mode and read-mode?
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

Hello,

I'ld like to make a trace of whether a CFI FlashROM is in read- or
write mode, but have difficulty understanding where this transition
occurs in the MTD source code.

Can someone give me a pointer?


Regards,
-- 
Leon
