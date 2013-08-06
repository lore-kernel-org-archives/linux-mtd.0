Received: from mail-oa0-f44.google.com ([209.85.219.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6e7x-0000ci-Ik
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 10:04:30 +0000
Received: by mail-oa0-f44.google.com with SMTP id l20so352251oag.3
 for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2013 03:04:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1369814927.21070.0.camel@sauron.fi.intel.com>
References: <1367237268-21694-1-git-send-email-linus.walleij@stericsson.com>
 <1369814927.21070.0.camel@sauron.fi.intel.com>
Date: Tue, 6 Aug 2013 12:04:03 +0200
Message-ID: <CACRpkdb5L+dTFyVHekA-_xGgq4M6-r3tEZDESfWWjV8QQNttTQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fsmc: update of OF support
From: Linus Walleij <linus.walleij@linaro.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vipin Kumar <vipin.kumar@st.com>,
 Linus Walleij <linus.walleij@stericsson.com>,
 Anmar Oueja <anmar.oueja@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 29, 2013 at 10:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2013-04-29 at 14:07 +0200, Linus Walleij wrote:
>> From: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
>>
>> Add nand bank selection and timings to the device tree bindings.
>>
>> Cc: Stefan Roese <sr@denx.de>
>> Cc: Vipin Kumar <vipin.kumar@st.com>
>> Signed-off-by: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
>> [Added some documentation]
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Pushed to l2-mtd.git, thanks!

Where did this go? It didn't turn up in v3.11-rc1, is it simply
postponed to v3.12?

Yours,
Linus Walleij
