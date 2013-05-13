Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubmuf-0005yl-GF
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:11:14 +0000
Received: by mail-ob0-f178.google.com with SMTP id v19so2505307obq.9
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 00:10:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368428882.5360.3.camel@sauron.fi.intel.com>
References: <1365860324-21295-1-git-send-email-linkinjeon@gmail.com>
 <1368428882.5360.3.camel@sauron.fi.intel.com>
Date: Mon, 13 May 2013 16:10:51 +0900
Message-ID: <CAKYAXd8-TfSxh=z0GHuN-y5Z1OvVh89WYEV1+zeHzm5LorP1SA@mail.gmail.com>
Subject: Re: [PATCH 3/8] mtd: use generic helper to set max_discard_sectors
From: Namjae Jeon <linkinjeon@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: axboe@kernel.dk, nbd-general@lists.sourceforge.net,
 Vivek Trivedi <t.vivek@samsung.com>, npiggin@kernel.dk, neilb@suse.de,
 dwmw2@infradead.org, Paul.Clements@steeleye.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 Namjae Jeon <namjae.jeon@samsung.com>, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, cjb@laptop.org, shli@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/13, Artem Bityutskiy <dedekind1@gmail.com>:
> On Sat, 2013-04-13 at 22:38 +0900, Namjae Jeon wrote:
>> From: Namjae Jeon <namjae.jeon@samsung.com>
>>
>> It is better to use blk_queue_max_discard_sectors helper
>> function to set max_discard_sectors as it checks
>> max_discard_sectors upper limit UINT_MAX >> 9
>>
>> similar issue was reported for mmc in below link
>> https://lkml.org/lkml/2013/4/1/292
>
> Pushed to l2-mtd.git, thanks!
>
Hi. Artem.
Please revert this patch and ignore it.
Because this issue was already fixed by the below patch.
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=871dd9286e25330c8a581e5dacfa8b1dfe1dd641

Sorry for interrupt.
Thanks.
> --
> Best Regards,
> Artem Bityutskiy
>
>
