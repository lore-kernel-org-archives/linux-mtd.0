Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cECYc-0001GH-DB
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 10:01:07 +0000
Received: by mail-yw0-x236.google.com with SMTP id t125so268466045ywc.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 02:00:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <88af03f9-a222-b38e-9cbe-eb38e09248ed@nod.at>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
 <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
 <CAL-1w2tro0Zsybz8eBE22LXd_LV6ReFbT+4WDxU9z0NWFLY=bw@mail.gmail.com>
 <88af03f9-a222-b38e-9cbe-eb38e09248ed@nod.at>
From: Rock Lee <rockdotlee@gmail.com>
Date: Tue, 6 Dec 2016 18:00:44 +0800
Message-ID: <CAL-1w2vH681jKYFFz_h=L5ajZ2mRebXxp8gxLjoqMwXGk8aJ9g@mail.gmail.com>
Subject: Re: UBIFS crash in power cutting test
To: Richard Weinberger <richard@nod.at>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I suspect a bug in the UBIFS xattr code. I saw such a report some
> time ago but the reporter disappeared before I was able to hunt to the issue down.
>
> When you face the crash, is is persistent or does it go away after a reset?
> If it stays, can you share me the filesystem?

Yes, it is persistent, this image(/dev/mtd18 dd image) is about 25MB,
how do I share it with you?
