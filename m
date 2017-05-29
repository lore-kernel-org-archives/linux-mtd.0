Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFHjq-0006l8-H6
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 10:17:28 +0000
Subject: Re: [PATCH] ubifs: Add freeze support
To: Amir Goldstein <amir73il@gmail.com>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at> <20170529011834.GB10215@sebu>
 <20170529044059.GA12991@sebu>
 <CAOQ4uxgdTnDY2Vpo0S+oyZkFN37GX-G=om3qATwtC1WF1g_NDw@mail.gmail.com>
 <bca235a8-7e25-8857-1c52-5b872a027eea@nod.at>
 <CAOQ4uxiYxdfTgrPo-ej7mS4ShAm2d4bU4v8y63Ej+c1kKXEMow@mail.gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <b81dcdea-19d8-be73-057d-7059cf5fb3ab@nod.at>
Date: Mon, 29 May 2017 12:17:00 +0200
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxiYxdfTgrPo-ej7mS4ShAm2d4bU4v8y63Ej+c1kKXEMow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amir,

Am 29.05.2017 um 12:04 schrieb Amir Goldstein:
>> Well, UBIFS is a bit different.
>> The UBIFS journal is not an add-on feature, you have to replay it in
>> any case. Otherwise you're facing corrupted data.
> 
> Yes, I suppose you are right.
> I guess there is no equivalent of mount -oro,{norecovery,noload} for
> ubifs.

Correct.

> I don't know the ubifs journal implementation details.
> Can ubifs_run_commit() when writers are frozen contribute to
> shorter journal replay time after boot with some workloads?

If the journal is empty then mounting will be faster, yes.
But I'm still interested in Hyunchul's use-case/problem.
Usually you run UBIFS in an embedded environment where you simple
never shutdown or reboot in a clean way. The power supply just
cut off.

On the other hand, if you want an empty journal for a faster mount,
just make sure that you umount upon shutdown.
Or make the size of the journal smaller at mkfs time.
Also see:

commit 27ad27993313312a4ad0047d0a944c425cd511a5
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Thu Jan 29 16:34:30 2009 +0200

    UBIFS: remove fast unmounting

    This UBIFS feature has never worked properly, and it was a mistake
    to add it because we simply have no use-cases. So, lets still accept
    the fast_unmount mount option, but ignore it. This does not change
    much, because UBIFS commit in sync_fs anyway, and sync_fs is called
    while unmounting.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Thanks,
//richard
