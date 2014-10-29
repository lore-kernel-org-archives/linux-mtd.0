Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjRvV-0003cW-Gl
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:00:34 +0000
Message-ID: <5450D6C4.4040400@nod.at>
Date: Wed, 29 Oct 2014 13:00:04 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
In-Reply-To: <5450C997.9010205@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
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

Tanya,

Am 29.10.2014 um 12:03 schrieb Tanya Brokhman:
> I'll try to address all you comments in one place.
> You're right that the read counters don't have to be exact but they do have to reflect the real state.

But it does not really matter if the counters are a way to high or too low?
It does also not matter if a re-read of adjacent PEBs is issued too often.
It won't hurt.

> Regarding your idea of saving them to a file, or somehow with userspace involved; This is doable, but such solution will depend on user space implementation:
> - one need to update kernel with correct read counters (saved somewhere in userspace)
> - it is required on every boot.
> - saving the counters back to userspace should be periodically triggered as well.
> So the minimal workflow for each boot life cycle will be:
> - on boot: update kernel with correct values from userspace

Correct.

> - kernel updates the counters on each read operation

Yeah, that's a plain simple in kernel counter..

> - on powerdown: save the updated kernel counters back to userspace

Correct. The counters can also be saved once a day by cron.
If one or two save operations are missed it won't hurt either.

> The read-disturb handling is based on kernel updating and monitoring read counters. Taking this out of the kernel space will result in an incomplete and very fragile solution for
> the read-disturb problem since the dependency in userspace is just too big.

Why?
We both agree on the fact that the counters don't have to be exact.
Maybe I'm wrong but to my understanding they are just a rough indicator that sometime later UBI has to check for bitrot/flips.

> Another issue to consider is that each SW upgrade will result in loosing the counters saved in userspace and reset all. Otherwise, system upgrade process will also have to be updated.

Does it hurt if these counters are lost upon an upgrade?
Why do we need them for ever?
If they start after an upgrade from 0 again heavily read PEBs will quickly gain a high counter and will be checked.

And of course these counters can be preserved. One can also place them into a UBI static volume.
Or use a sane upgrade process...

As I wrote in my last mail we could also create a new internal UBI volume to store these counters.
Then you can have the logic in kernel but don't have to change the UBI on-disk layout.

> The read counters are very much like the ec counters used for wear-leveling; One is updated on each erase, other on each read; One is used to handle issues caused by frequent
> writes (erase operations), the  other handle issues caused by frequent reads.
> So how are the two different? Why isn't wear-leveling (and erase counters) handled by userspace? My guess that the decision to encapsulate the wear-leveling into the kernel was due
> to the above mentioned reasons.

The erase counters are crucial for UBI to operate. Even while booting up the kernel and mounting UBIFS the EC counters have to available
because UBI maybe needs to move LEBs around or has to find free PEBs which are not worn out. I UBI makes here a bad decision things will break.

Again, to my understanding read counters are just a rough indicator when to have a check.
If we don't do this check immediately, nothing will go bad. As I understand the feature it is something like "Oh, the following PEBs got read a lot in the last few hours, let's
trigger a check later." Same applies for the timestamps.

Thanks,
//richard

P.s: Is my assumption correct that read counters are needed because newer MLC-NANDs are so crappy? ;-)
