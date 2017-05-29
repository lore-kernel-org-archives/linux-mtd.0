Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFGeI-00021M-JB
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 09:07:40 +0000
Subject: Re: [PATCH] ubifs: Add freeze support
To: Amir Goldstein <amir73il@gmail.com>, Hyunchul Lee <hyc.lee@gmail.com>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at> <20170529011834.GB10215@sebu>
 <20170529044059.GA12991@sebu>
 <CAOQ4uxgdTnDY2Vpo0S+oyZkFN37GX-G=om3qATwtC1WF1g_NDw@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <bca235a8-7e25-8857-1c52-5b872a027eea@nod.at>
Date: Mon, 29 May 2017 11:00:32 +0200
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxgdTnDY2Vpo0S+oyZkFN37GX-G=om3qATwtC1WF1g_NDw@mail.gmail.com>
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

Amir, Hyunchul,

Am 29.05.2017 um 07:40 schrieb Amir Goldstein:
> On Mon, May 29, 2017 at 7:40 AM, Hyunchul Lee <hyc.lee@gmail.com> wrote:
>>
>> and I missed the following case.
>>
>> in some embedded systems, clean-up for shutdown should be fast.
>> during this clean-up, freeze file system to guarantee integrity.
>> umount with MNT_DETACH is not suitable because of not killing tasks.

more details please, UBIFS is designed to survive a power-cut/reboot/etc.
at any time. How would it corrupt?

> Interesting point. It seems that good old "sync; reboot" does not cut
> it anymore.
> Not even emergency remount read-only sysrq trigger.
> 
> Some of you may have been following this thread on fsdevel:
> https://www.spinics.net/lists/linux-xfs/msg06953.html
> 
> Probably less have been following this longer thread on xfs list:
> https://www.spinics.net/lists/linux-xfs/msg06883.html

Well, UBIFS is a bit different.
The UBIFS journal is not an add-on feature, you have to replay it in
any case. Otherwise you're facing corrupted data.
What simple bootloaders often do is it replaying the journal only to memory
but don't write back to the MTD.

Thanks,
//richard
