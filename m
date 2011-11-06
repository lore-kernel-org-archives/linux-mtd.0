Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RN3f6-0004io-0K
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2011 14:25:28 +0000
Received: from [192.168.12.102] (111.sub-166-250-1.myvzw.com [166.250.1.111])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id pA6EPJbI051146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Sun, 6 Nov 2011 06:25:21 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4EB6A6A8.7010703@newsguy.com>
Date: Sun, 06 Nov 2011 07:24:24 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubi on MLC nand flash
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

Hi everyone,

I recently started to do serious testing of UBI on the diskonchip G4 MLC nand
driver I'm finishing up.  I started with the io_basic ubi test in mtd-utils. 
What I find is that, after a few minutes, enough PEBs are marked as bad to
exhaust the reserve PEB pool, UBI switches to r/o mode, and the test fails.  The
reason is that - on this device at least - bit flips seem to be persistent;
i.e., you will get e.g. 1 bit flip every time you read a certain page. 
Consequently, when the bit flip occurs and the PEB gets scrubbed, the torture
test fails because the bit flip reoccurs, and the PEB is marked bad.

I expected that eventually I might have to dig into the "program disturb",
"read-disturb" or "paired pages" MLC issues, but the problem seems more
fundamental.  My general impression is that UBI is too unforgiving for this
device.  The ecc can correct up to 4 bit flips, so 1 bit flip seems to not be a
big deal.  I'm new to UBI so this is not a critique or a proposal, I'm just
hoping some experts can offer some advice or opinions.  The obvious remedy is to
set a higher threshold for marking a PEB as bad, say 2 or 3 bit flips.

Thanks,
Mike
