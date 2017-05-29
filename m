Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFJ6n-0003T5-Vy
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 11:45:15 +0000
Received: by mail-oi0-x244.google.com with SMTP id v80so11059874oie.2
 for <linux-mtd@lists.infradead.org>; Mon, 29 May 2017 04:44:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b81dcdea-19d8-be73-057d-7059cf5fb3ab@nod.at>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at> <20170529011834.GB10215@sebu>
 <20170529044059.GA12991@sebu>
 <CAOQ4uxgdTnDY2Vpo0S+oyZkFN37GX-G=om3qATwtC1WF1g_NDw@mail.gmail.com>
 <bca235a8-7e25-8857-1c52-5b872a027eea@nod.at>
 <CAOQ4uxiYxdfTgrPo-ej7mS4ShAm2d4bU4v8y63Ej+c1kKXEMow@mail.gmail.com>
 <b81dcdea-19d8-be73-057d-7059cf5fb3ab@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 29 May 2017 14:44:52 +0300
Message-ID: <CAOQ4uxiSJ1+LjMTpHsrk3ED3=7DMRFmKafGiMXC=EwewK3M8Mw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add freeze support
To: Richard Weinberger <richard@nod.at>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 kernel-team@lge.com, linux-mtd@lists.infradead.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 29, 2017 at 1:17 PM, Richard Weinberger <richard@nod.at> wrote:
> Amir,
>
> Am 29.05.2017 um 12:04 schrieb Amir Goldstein:
>>> Well, UBIFS is a bit different.
>>> The UBIFS journal is not an add-on feature, you have to replay it in
>>> any case. Otherwise you're facing corrupted data.
>>
>> Yes, I suppose you are right.
>> I guess there is no equivalent of mount -oro,{norecovery,noload} for
>> ubifs.
>
> Correct.
>
>> I don't know the ubifs journal implementation details.
>> Can ubifs_run_commit() when writers are frozen contribute to
>> shorter journal replay time after boot with some workloads?
>
> If the journal is empty then mounting will be faster, yes.
> But I'm still interested in Hyunchul's use-case/problem.

Makes sense.

> Usually you run UBIFS in an embedded environment where you simple
> never shutdown or reboot in a clean way. The power supply just
> cut off.
>
> On the other hand, if you want an empty journal for a faster mount,
> just make sure that you umount upon shutdown.

So you see, unmount upon shutdown is not always an option
when you are in a system where not all tasks are killed before
attempting to unmount (or even attempting to remounr,ro).
This is what Darrick's patch was all about.

Maybe there is no such embedded system...
With the numbers of different embedded systems going to infinity,
the probability of no "such embedded system" is unlikely.

FIFREEZE gives a privileged process the ability to checkpoint the
journal (e.g. for shorter mount time) and reboot without having to
kill all other processes in the system first.

Amir.
