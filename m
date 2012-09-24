Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGAT1-0001nC-NH
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 15:21:04 +0000
Received: by lbbgf7 with SMTP id gf7so171013lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 08:21:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348499187.4880.66.camel@sauron.fi.intel.com>
References: <1348263626-3087-1-git-send-email-csd@broadcom.com>
 <1348263626-3087-2-git-send-email-csd@broadcom.com>
 <1348499187.4880.66.camel@sauron.fi.intel.com>
Date: Mon, 24 Sep 2012 08:21:00 -0700
Message-ID: <CAOesGMgs6Vq4yhKP6_4qHkJjo5vij=ww9VN7Yfz7QYxT95Ntaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: Remove bcmring NAND driver
From: Olof Johansson <olof@lixom.net>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Arnd Bergmann <arnd@arndb.de>, Christian Daudt <csd@broadcom.com>,
 Will Deacon <will.deacon@arm.com>, cdaudt@gmail.com,
 "arm@kernel.org" <arm@kernel.org>, linux-mtd@lists.infradead.org,
 "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 24, 2012 at 8:06 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-09-21 at 14:40 -0700, Christian Daudt wrote:
>> This driver is being removed as part of the cleanup of the bcmring
>> SoC from mainline as it is no longer maintained.
>>
>> Signed-off-by: Christian Daudt <csd@broadcom.com>
>> Reviewed-by: Jiandong Zheng <jdzheng@broadcom.com>
>> Acked-by: Will Deacon <will.deacon@arm.com>
>
> Pushed this patch to l2-mtd.git. But if you decide to merge it via
> Arnd's tree (probably better idea) - let me know, I'll drop it.

Keeping it in mtd is fine.


-Olof
