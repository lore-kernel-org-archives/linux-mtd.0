Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAk7T-0005JO-VP
 for linux-mtd@lists.infradead.org; Fri, 25 Jul 2014 18:21:28 +0000
Received: by mail-ig0-f173.google.com with SMTP id h18so1206951igc.0
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2014 11:21:06 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 25 Jul 2014 11:21:06 -0700
Message-ID: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
Subject: Using UBIFS as an FTL
From: Daniel Ehrenberg <dehrenberg@google.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, others,

For my project, I'm looking into using ext4 on top of NAND flash, in
order to use some fancy ext4 features. For this, I need an FTL in the
middle. I'm wondering which would be good to use. Options that I've
looked at are:
- ubiblock--the read-modify-write sounds unacceptable to me, even if
wear leveling and atomicity are handled.
- Some coworkers have suggested a new effort to build a new block
device, but that that's a huge project and takes a long time to get
right.
- loopback-mounting a file on ubifs--From skimming the code, it looks
to me like ubifs uses some nice datastructures to handle writes within
a file without doing read-modify-writes all the time as ubiblock
forces. ubifs authors/maintainers, do you see any downside to using
ubifs this way?

Thanks,
Dan
