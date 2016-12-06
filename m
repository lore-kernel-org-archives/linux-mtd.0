Received: from mail-yw0-x22c.google.com ([2607:f8b0:4002:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEBRN-0007tf-1Q
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 08:49:33 +0000
Received: by mail-yw0-x22c.google.com with SMTP id r204so268296158ywb.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 00:49:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
 <CAFLxGvwKKqOWn2Eb06z0JaNo2vxhgi4somVw8bgkFrvtDPY5uw@mail.gmail.com>
From: Rock Lee <rockdotlee@gmail.com>
Date: Tue, 6 Dec 2016 16:49:10 +0800
Message-ID: <CAL-1w2tro0Zsybz8eBE22LXd_LV6ReFbT+4WDxU9z0NWFLY=bw@mail.gmail.com>
Subject: Re: UBIFS crash in power cutting test
To: Richard Weinberger <richard.weinberger@gmail.com>
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

Hi, Richard

> does the flash function correctly?
> IOW do both MTD and UBI tests pass?
Sorry, I haven't tested MTD & UBI yet, but when UBIFS crashes, there
is no MTD & UBI error message.

> Are you using xattrs?
Yes, I used xattrs (smack on root), and specifed  smackfsdef='_' to
ubifs mount options.
