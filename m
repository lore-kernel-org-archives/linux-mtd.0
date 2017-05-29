Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFDPt-0004kN-I1
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 05:40:35 +0000
Received: by mail-oi0-x229.google.com with SMTP id l18so67389560oig.2
 for <linux-mtd@lists.infradead.org>; Sun, 28 May 2017 22:40:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170529044059.GA12991@sebu>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at> <20170529011834.GB10215@sebu>
 <20170529044059.GA12991@sebu>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 29 May 2017 08:40:11 +0300
Message-ID: <CAOQ4uxgdTnDY2Vpo0S+oyZkFN37GX-G=om3qATwtC1WF1g_NDw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add freeze support
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
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

On Mon, May 29, 2017 at 7:40 AM, Hyunchul Lee <hyc.lee@gmail.com> wrote:
>
> and I missed the following case.
>
> in some embedded systems, clean-up for shutdown should be fast.
> during this clean-up, freeze file system to guarantee integrity.
> umount with MNT_DETACH is not suitable because of not killing tasks.
>

Interesting point. It seems that good old "sync; reboot" does not cut
it anymore.
Not even emergency remount read-only sysrq trigger.

Some of you may have been following this thread on fsdevel:
https://www.spinics.net/lists/linux-xfs/msg06953.html

Probably less have been following this longer thread on xfs list:
https://www.spinics.net/lists/linux-xfs/msg06883.html
