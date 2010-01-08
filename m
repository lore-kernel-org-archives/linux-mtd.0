Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGOY-0007Hi-HT
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:05:02 +0000
Received: by fxm22 with SMTP id 22so21920351fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 07:04:56 -0800 (PST)
Subject: RFC: [PATCH V2 0/9 Integration of SmartMedia/xD into mtd subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Jan 2010 17:04:52 +0200
Message-ID: <1262963092.12577.14.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is second version of my patchset.

Changes since V1:

-> Ported to latest kernel revision (2.6.33-rc3)
-> Resolved problem with oob layout
-> Resoved all checkpatch.pl issues
-> Tested that indeed all hardware devices of this type have
same PCI ID


Remaining issues:

* Write speed is of course still very low, but like I said, it might be
hardware problem.

* No support for 256 byte SmartMedia in the FTL. I don't have the
hardware to test that, and I think for now there is not much need for
that.
(It only applies to 1MB and 2MB SmartMedia devices anyway...)

* Like I said some XD cards are fake, thus have to be used with the FTL,
This is a hardware problem too.
If I knew which xD cards are affected, and had a way to know for sure
they have an FTL inside, I could implement a fake FTL, thus gain higher
write speed (and maybe solve that way issue #1)


Best regards,
Maxim Levitsky
