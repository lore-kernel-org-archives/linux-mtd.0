Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTvX0-0003p0-Mv
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 16:23:07 +0000
Received: by mail-wg0-f51.google.com with SMTP id k14so88053wgh.10
 for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2014 09:22:36 -0700 (PDT)
Message-ID: <1410884555.23903.13.camel@lp-lvrv.comap.cz>
Subject: Destructive nandtest?
From: Rostislav Lisovy <lisovy@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 16 Sep 2014 18:22:35 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Michal Vokac <michal.vokac@comap.cz>, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel =?ISO-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello;
I need to test a NAND flash on my embedded device running GNU/Linux.
I thought the nandtest utility will work just fine, however I hit some
unpleasant behavior.
My requirement is to perform a non-destructive test. The nandtest
utility seems to support it with the "-k, --keep  Restore existing
contents after test" option, however the reality is different.
The testing scenario (performed by the nandtest) is
* Backup the original eraseblock (EB) data
* Generate some random data
* Erase the EB
* Store the random data
* Read the stored data and compare with the generated buffer
* Erase the EB, Write the original content

Everything seems to make sense until we ask the question "what about the
OOB data?". Is the original OOB data saved? The answer is: No, it is
not.
This will somehow work in cases the OOB stores only the ECC for the
written pages -- if we read the page (OOB contains the ECC), erase the
EB and then write the same page back, the OOB will once again contain
the same ECC. What if there will be some "extra data" stored in the OOB
(I think JFFS2 does this)? This data will be lost.

Another sneaky misbehavior is "restoring of erased pages". If the EB is
erased (all 0xFF), the nandtest reads the "data stored in the EB",
performs the tests and then restores the "data" back by filling all the
pages with 0xFF -- this will not only fill the OOB with ECC for the
newly written "data" but will deplete the "maximum per-page-write
limit" (which is either 1x after each erase or more if the sub-page
write is supported by the device).
All this described behavior was discovered after long hours of analyzing
different nanddumps.

What do you think about the issue? Is this the "normal nanddump"
behavior or a hidden fault? Do we need a new nandtest or at least remove
the "-k, --keep  Restore existing contents after test" option?
I will appreciate your thoughts.

Best regards;
Rostislav Lisovy
