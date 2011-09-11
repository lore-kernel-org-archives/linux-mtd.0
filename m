Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2ht4-0005Bx-7r
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 11:07:46 +0000
Received: by pzk4 with SMTP id 4so6500784pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 04:07:44 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: fix the dark space calculation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Date: Sun, 11 Sep 2011 14:10:10 +0300
In-Reply-To: <CAMjNe_fj+FQSV9fX-sjh3hdW-CTNaqwmnS+36if6NcvLtpxOKw@mail.gmail.com>
References: <CAMjNe_fj+FQSV9fX-sjh3hdW-CTNaqwmnS+36if6NcvLtpxOKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315739414.18731.14.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-08-26 at 16:08 +0530, srimugunthan dhandapani wrote:
> hi,
> The dark space calculation should be 64 bit type-casted ,when
> assigning to tmp64( similar to how total_free is calculated).
> Overflow will occur for very large flashes.

The patch did not apply to the latest UBIFS, but I have amended it.
Pushed to ubifs-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
