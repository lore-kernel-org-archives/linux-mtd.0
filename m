Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRgsX-0007WN-1J
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 11:15:34 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [RESEND PATCH 0/2] mtd: Harmonize implementations of OTP write and
 _get_{fact, user}_prot_info
Date: Thu, 3 Oct 2013 13:14:34 +0200
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <d11cf30b-a84f-44cf-a7b8-81c5e846a64a@mary.at.omicron.at>
Cc: Amul Kumar Saha <amul.saha@samsung.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

In the discussion on my patchset for the OTP support for
drivers/mtd/chips/cfi_cmdset_0002.c [1-5], Artem requested two changes in the
current code of the OTP write functions and the _get_{fact,user}_prot_info
code.

These two patches are an attempt to make the requested changes.

The first patch adds a retlen parameter to the _get_fact_prot_info and
_get_user_prot_info functions and thus harmonizes the implementation
with those of the write and read functions.

The second patch fixes a problem that I earlier addressed in [1]. After
the discussion about this patch on the mtd mailing list, I think that the
correct behavior of the write function should be the one specified in [6]:
Try to write as many bytes as possible and return the number of bytes
that were written. If no data could be written due to lack of OTP memory,
return -ENOSPC.

Artem, would you please have a look at these patches? I would like to know
if I understood you correctly, or if I missed something here. Please note
that I cannot test these patches since I do not have the hardware. The
patches are compile tested only. If these patches are ok, I will also
respin the OTP support patches for cfi_cmdset_0002.

Thank you!

Best regards,
Christian

[1] http://patchwork.ozlabs.org/patch/239897/
[2] http://patchwork.ozlabs.org/patch/240010/
[3] http://patchwork.ozlabs.org/patch/240007/
[4] http://patchwork.ozlabs.org/patch/240008/
[5] http://patchwork.ozlabs.org/patch/240009/
[6] http://pubs.opengroup.org/onlinepubs/9699919799/functions/write.html

Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Amul Kumar Saha <amul.saha@samsung.com>

Christian Riesch (2):
  mtd: Add a retlen parameter to _get_{fact,user}_prot_info
  mtd: Fix the behavior of otp write if there is not enough room for
    data

 drivers/mtd/chips/cfi_cmdset_0001.c |   44 +++++++++++++++++++----------------
 drivers/mtd/devices/mtd_dataflash.c |   20 +++++++---------
 drivers/mtd/mtdchar.c               |   18 ++++++++++----
 drivers/mtd/mtdcore.c               |   12 +++++-----
 drivers/mtd/mtdpart.c               |   14 ++++++-----
 drivers/mtd/onenand/onenand_base.c  |   41 +++++++++++++++++---------------
 include/linux/mtd/mtd.h             |   16 ++++++-------
 7 files changed, 90 insertions(+), 75 deletions(-)

-- 
1.7.9.5
