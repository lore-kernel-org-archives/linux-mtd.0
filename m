Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1xwi-00075U-5E
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 13:50:20 +0000
Received: by mail-vc0-f179.google.com with SMTP id le20so325557vcb.38
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 05:49:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
Date: Fri, 19 Dec 2014 14:49:58 +0100
Message-ID: <CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
Subject: Re: Get error -74 (ECC error) during ubiattach
From: Richard Weinberger <richard.weinberger@gmail.com>
To: t kevin <kevint324@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 19, 2014 at 1:24 PM, t kevin <kevint324@gmail.com> wrote:
> Hi all,
>
> I get below error message everytime when my box boots up.
> It appears there is a ECC error. But such errors should be taken care
> by UBI/UBIFS itself, right?

No. If the MTD reports an uncorrectable ECC error UBI can do nothing.

> Is it because the background thread "ubi_bgt2d" has not started yet so
> no one could do the data scrubbing during ubiattach stage?

UBI does scrubbing if it faces bit-flips (correctable ECC errors).

> Is it possible to do something like a fsck.ubifs to fix this issue?

No. PEB 404 is bad.
Is it always the same block?

I tend to remove the dump_stack() in this error path. It is a bit overkill.

-- 
Thanks,
//richard
