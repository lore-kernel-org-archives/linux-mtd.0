Received: from bh-25.webhostbox.net ([208.91.199.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtHFP-0003Ri-UU
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 15:42:17 +0000
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jesper Nilsson <jespern@axis.com>, linux-cris-kernel@axis.com
From: Guenter Roeck <linux@roeck-us.net>
Subject: Problems with 'mtd: warn when registering the same master many times'
Message-ID: <5637843C.10307@roeck-us.net>
Date: Mon, 2 Nov 2015 07:41:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

I see the following warnings in recent mips qemu tests on linux-next.

WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:619 mtd_device_parse_register+0x160/0x16c()
MTD already registered

Looking into the code, this is the result of your patch 'mtd: warn when registering
the same master many times'.

This patch is supposed to warn if mtd_device_parse_register is called multiple times
with the same mtd_info structure pointer as parameter.

At the surface, the check appears to make sense. However, it has a problem.
The output of "git grep reboot_notifier.notifier_call" in drivers/mtd results in

chips/cfi_cmdset_0001.c:        mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
chips/cfi_cmdset_0002.c:        mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
mtdcore.c:      WARN_ONCE(mtd->reboot_notifier.notifier_call, "MTD already registered\n");
mtdcore.c:      if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
mtdcore.c:              mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;

As it turns out, the observed warning is not seen because mtd_device_parse_register()
is called multiple times. It is seen because mtd->reboot_notifier.notifier_call
is already set to cfi_intelext_reboot by the time it is checked.

I don't know if this is a bug in the mtd code, or if this is a valid use case.
Whatever it is, the warning does not warn about the driver, it warns about a potential
inconsistency in the mtd code itself (and if it is is a valid use case, the warning
is inappropriate). Maybe it would make sense to change the warning as follows ?

WARN_ONCE(mtd->_reboot && mtd->reboot_notifier.notifier_call, "MTD already registered\n");

I am not sure, though, if that is correct, since even that might be a valid use case
(a caller registering a cfi based mtd device with a _reboot callback).

I also see the warning in crisv32 runtime tests. This is because the code in
arch/cris/arch-v32/drivers/axisflashmap.c calls mtd_device_register() multiple times
with the same mtd_info argument, each time to register a different partition.
I am not sure if the check is appropriate for this case either, since the code calls
mtd_device_register(), both 'type' and 'parser_data' are NULL, parse_mtd_partitions()
does not do anything, and the problem you are concerned about does not apply.

How about changing the warning to something like the following ?

WARN_ONCE(types && mtd->_reboot && mtd->reboot_notifier.notifier_call, "MTD already registered\n");

This would eliminate (what I think are) false positives and only warn if there
is a real problem.

Thanks,
Guenter
