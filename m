Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFHXY-0007gw-DG
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 10:04:46 +0000
Received: by mail-oi0-x235.google.com with SMTP id h4so73611581oib.3
 for <linux-mtd@lists.infradead.org>; Mon, 29 May 2017 03:04:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <bca235a8-7e25-8857-1c52-5b872a027eea@nod.at>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at> <20170529011834.GB10215@sebu>
 <20170529044059.GA12991@sebu>
 <CAOQ4uxgdTnDY2Vpo0S+oyZkFN37GX-G=om3qATwtC1WF1g_NDw@mail.gmail.com>
 <bca235a8-7e25-8857-1c52-5b872a027eea@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 29 May 2017 13:04:22 +0300
Message-ID: <CAOQ4uxiYxdfTgrPo-ej7mS4ShAm2d4bU4v8y63Ej+c1kKXEMow@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add freeze support
To: Richard Weinberger <richard@nod.at>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 kernel-team@lge.com, linux-mtd@lists.infradead.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 29, 2017 at 12:00 PM, Richard Weinberger <richard@nod.at> wrote:
> Amir, Hyunchul,
>
> Am 29.05.2017 um 07:40 schrieb Amir Goldstein:
>> On Mon, May 29, 2017 at 7:40 AM, Hyunchul Lee <hyc.lee@gmail.com> wrote:
>>>
>>> and I missed the following case.
>>>
>>> in some embedded systems, clean-up for shutdown should be fast.
>>> during this clean-up, freeze file system to guarantee integrity.
>>> umount with MNT_DETACH is not suitable because of not killing tasks.
>
> more details please, UBIFS is designed to survive a power-cut/reboot/etc.
> at any time. How would it corrupt?
>
>> Interesting point. It seems that good old "sync; reboot" does not cut
>> it anymore.
>> Not even emergency remount read-only sysrq trigger.
>>
>> Some of you may have been following this thread on fsdevel:
>> https://www.spinics.net/lists/linux-xfs/msg06953.html
>>
>> Probably less have been following this longer thread on xfs list:
>> https://www.spinics.net/lists/linux-xfs/msg06883.html
>
> Well, UBIFS is a bit different.
> The UBIFS journal is not an add-on feature, you have to replay it in
> any case. Otherwise you're facing corrupted data.

Yes, I suppose you are right.
I guess there is no equivalent of mount -oro,{norecovery,noload} for
ubifs.

I don't know the ubifs journal implementation details.
Can ubifs_run_commit() when writers are frozen contribute to
shorter journal replay time after boot with some workloads?

Amir.
