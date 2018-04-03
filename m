Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3Kft-0006mv-7Y
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2018 12:04:30 +0000
Received: by mail-wr0-x22a.google.com with SMTP id l49so18497070wrl.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Apr 2018 05:04:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
References: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 3 Apr 2018 14:04:16 +0200
Message-ID: <CAFLxGvz=_x2NWhz_T_TqKc5JnRC+fGkD37daf+zks-pnyydMyw@mail.gmail.com>
Subject: Re: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
To: "Erdrich, Frank" <Frank.Erdrich@emtrion.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank,

On Tue, Apr 3, 2018 at 10:28 AM, Erdrich, Frank
<Frank.Erdrich@emtrion.de> wrote:
> Hello,
>
> we are encountering an error on UBIFS that prevents mounting of a partition. Maybe one of you can tell me the directly the reason for that or can help me hunting this error down.

UBIFS got confused wrt. free space accounting.
Can you tell me more on your setup? Do you use Fastmap? fscrypt? xattr?

> I'm not deep enough in the ubifs system to completely understand what is happening here but for me it seems that there are more dirty data to write than the size of the LEB.
> -> 3: free 507904 dirty 524128 flags 34 lnum 0
> I've seen that the values are checked in validate_pnode() where the -EINVAL (-22) comes from. The question is, how can dirty data bigger that the LEB size?

Yes, this can happen. That's why UBIFS does in some cases a fixup of
the used/free numbers.
These numbers are not always updated immediately and when a power-cut
happens their state might be inconsistent.

-- 
Thanks,
//richard
