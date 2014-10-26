Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XiUb9-0008RO-K3
 for linux-mtd@lists.infradead.org; Sun, 26 Oct 2014 20:39:36 +0000
Message-ID: <544D5BEC.50802@nod.at>
Date: Sun, 26 Oct 2014 21:39:08 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
In-Reply-To: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.10.2014 um 14:49 schrieb Tanya Brokhman:
> One of the limitations of the NAND devices is the method used to read
> NAND flash memory may cause bit-flips on the surrounding cells and result
> in uncorrectable ECC errors. This is known as the read disturb or data
> retention.
> 
> Today’s Linux NAND drivers implementation doesn’t address the read disturb
> and the data retention limitations of the NAND devices. To date these
> issues could be overlooked since the possibility of their occurrence in
> today’s NAND devices is very low. 
> 
> With the evolution of NAND devices and the requirement for a “long life”
> NAND flash, read disturb and data retention can no longer be ignored
> otherwise there will be data loss over time.
> 
> The following patch set implements handling of Read-disturb and Data
> retention by the UBI layer.

So, your patch addresses the following issue:
We need to re-read a PEB after a specific time (to detect bit rot) or after N reads (to detect read disturb issues).
Is this correct?

Currently users of UBI do this by having cron jobs which read the complete UBI volume
and then cause scrub work.
The draw back of this is that only UBI payload will be read and not all data like EC and VID headers.
I understand that you want to fix this issue.

According to my opinion it is not a good idea to store read counters and timestamps into the UBI/Fastmap on-disk layout.
Both the read counters and timestamps don't have to be exact values.

What about this idea?
Add a userspace interface which allows UBI to expose read counters and last access timestamps.
A userspace daemon (let's name it ubihealthd) then can decide whether it is time to trigger a re-read of a PEB.
This daemon can also store and load the timestamp values and counters from and to UBI. If it misses these meta data some times due to a
power cut it won't hurt.
We could also add another internal UBI volume which can carry these data.

All in all, I like the idea but changing/extending the on-disk layout is overkill IMHO.

Thanks,
//richard
