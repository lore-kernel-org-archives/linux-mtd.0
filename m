Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayNBp-00049k-AB
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 17:35:53 +0000
Received: by mail-ig0-x22e.google.com with SMTP id u10so22539495igr.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 10:35:32 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 5 May 2016 13:35:32 -0400
Message-ID: <CAKKoKz5T5uddqyV955gnNenH6ejt_xMU_odmTC1FoQrbNm3R7w@mail.gmail.com>
Subject: Implementing OTP
From: Tom Tatakis <ttatakis@appliedlogix.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have implemented OTP functionality in the NAND driver for the
Macronix MX30LF1G18AC device.  I would like to send it on up in a
patch but I'd like to confirm that what I did makes sense.  I modified
 nand_base.c file to include the requisite functions for reading and
writing the OTP.  I also modified the nand_scan_tail function to
assign the names of the functions in the mtd structure.  The potential
issue is that the ONFI command used to read and write the OTP uses a
feature address of 0x90 which is defined as part of the 'Vendor
Specific' area if I understand the ONFI spec (it's entirely possible
that I do not).  Specifically, section 5.30 in Version 4.0 of the ONFI
spec.

If my modification of nand_base.c to include this makes sense, then I
can put together a patch.

I did try and figure out a way to get this potentially device
dependent code into its own file, but I do not see how to do that
other than creating a whole other driver for it complete with a
configuration setting.  If that's what I need to do then I will try
and put it together.  If there is a better way and you can point me
int the right direction, that would be helpful as well.

Thanks for you time
Tom
