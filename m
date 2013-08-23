Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCsBT-00050N-1A
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 14:17:51 +0000
Received: by mail-lb0-f174.google.com with SMTP id w20so518743lbh.19
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 07:17:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACQ1gAj2bNOnnCqLjALW0LiXYiDw_CTYUTgsE4Jd5pH9DkWadA@mail.gmail.com>
References: <CACQ1gAgOS5kpykb1jxnRJUNCmdC1jwmmWr5cQ7aazKVvMjBPWQ@mail.gmail.com>
 <CACQ1gAj2bNOnnCqLjALW0LiXYiDw_CTYUTgsE4Jd5pH9DkWadA@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Aug 2013 16:17:06 +0200
Message-ID: <CACQ1gAiRZx1QdSUzmHpKtj_oHzdHB3cZLptE1h8UtUWs4UMiuA@mail.gmail.com>
Subject: Re: Fastmap and Atmel sam-ba
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For the record, if I use uboot instead of sam-ba to flash :
usb start
fatload usb 0 0x20008000 /userspace.ubi
nand device ubi
nand erase.part ubi
nand write.trimffs 0x20008000 ubi 32e0000

I've got the same error.

(And of course, no error when I use ubiformat !)

Richard.
