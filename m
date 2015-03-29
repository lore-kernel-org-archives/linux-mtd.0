Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcC69-0003RO-JI
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 12:13:51 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI: Bitrot checking
Date: Sun, 29 Mar 2015 14:13:13 +0200
Message-Id: <1427631197-23610-1-git-send-email-richard@nod.at>
Cc: boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of today UBI does not offer a way to reliable deal with
data retention and especially read disturb. Read disturb means that
a page X will face bitflips if you read page Y,
Y != X but within the same block, very often.
People who care about data retention often have cron jobs on their
targets which read from time to time whole UBI volumes.
Something like "dd if=/dev/ubi0_0 of=/dev/zero" every week.
If UBI faces bitflips while reading it will schedule the affected PEB
for scrubbing.
The major downside of this approach is that you don't catch all pages.
e.g. UBI EC and VID headers are not always read.
Also UBI internal data structure like volume table are not checked.
These pages are mostly read at attach time. So, if you run a
cron job and reboot often you are on the safe side.
With fastmap the issue is even worse as you don't scan every PEB at
attach time. In fact, I've seen read disturb issues on a customer's
target where he has installed such a cronjob.
But some targets still died due to read disturb issues.
It turned out that only targets with very high uptimes were affected.

To overcome that issue this patch series adds a bitrot checking
mechanism to UBI.
It can be triggered by writing to /sys/class/ubi/ubiX/trigger_bitrot_check.
Then UBI will read every PEB and schedule scrubbing or an appropriated
action if it detects flipped bits. Reading is done within the wear-leveling
thread such that it does not block other IO. I can also think of adding
a new thread to UBI which has a very low priority.
User can then replace the dd command in their cron jobs by a simple
"echo 1 > /sys/class/ubi/ubiX/trigger_bitrot_check".

This series is only part one of two. Part two will add new ioctl()
commands to the UBI device nodes such that we can develop something
like a ubi-healthd.
This daemon will be able to fetch statistics about every known PEB
and can trigger scrubbing. Especially for MLC NAND support more
advanced techniques are needed to deal with data retention. 

[PATCH 1/4] UBI: Introduce ubi_schedule_fm_work()
[PATCH 2/4] UBI: Introduce prepare_erase_work()
[PATCH 3/4] UBI: Introduce in_pq()
[PATCH 4/4] UBI: Implement bitrot checking

Thanks,
//richard
