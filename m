Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEVig-000230-WF
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 06:28:47 +0000
Received: by mail-yw0-x231.google.com with SMTP id a10so292413883ywa.3
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 22:28:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <937cc2da-b74b-6cfc-96ff-baf6128eb987@nod.at>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
 <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
 <CAL-1w2tro0Zsybz8eBE22LXd_LV6ReFbT+4WDxU9z0NWFLY=bw@mail.gmail.com>
 <88af03f9-a222-b38e-9cbe-eb38e09248ed@nod.at>
 <CAL-1w2vH681jKYFFz_h=L5ajZ2mRebXxp8gxLjoqMwXGk8aJ9g@mail.gmail.com>
 <937cc2da-b74b-6cfc-96ff-baf6128eb987@nod.at>
From: Rock Lee <rockdotlee@gmail.com>
Date: Wed, 7 Dec 2016 14:28:13 +0800
Message-ID: <CAL-1w2v2AYDjkFTR=FbtiJNHeUYcfxi6C+Sdgr5ZJo0W2Vw-ow@mail.gmail.com>
Subject: Re: UBIFS crash in power cutting test
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Richard:
I removed SMACK from kernel and tested power cutting again.
So far, 5 hours have passed,  the UBIFS crash doesn't show up.
It seems that xattr causes that problem.

Thanks
Rock lee
