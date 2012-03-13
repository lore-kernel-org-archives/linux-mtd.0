Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7RM1-00014f-9w
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 13:01:29 +0000
Received: by yenm10 with SMTP id m10so564640yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 06:01:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201203131353.40163.sr@denx.de>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
 <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
 <201203131353.40163.sr@denx.de>
Date: Tue, 13 Mar 2012 14:01:28 +0100
Message-ID: <CACRpkdZw-nR3uS=FKrOtzgTACWc+=FfrspuT9PvyXDm+RMRFSg@mail.gmail.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Linus Walleij <linus.walleij@linaro.org>
To: Stefan Roese <sr@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Armando Visconti <armando.visconti@st.com>,
 Vipin KUMAR <vipin.kumar@st.com>, dbaryshkov@gmail.com,
 linux-mtd@lists.infradead.org, Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 13, 2012 at 1:53 PM, Stefan Roese <sr@denx.de> wrote:
> On Tuesday 13 March 2012 13:39:32 Linus Walleij wrote:
>> > (...) and I get the default partitions from some SPEAr platform
>> > currently,
>>
>> This is just because of the above bug.
>>
>> I'll fix!
>
> I already sent a fix for this:
>
> mtd: fsmc_nand.c: Partition info from pdata overrides driver defaults

Oh sorry I was coding too quickly. Missed it previously.
Thanks for fixing this.

Artem, forget my patch if you like, if you already have Stefan's patch
applied, please add Cc: stable@kernel.org on it because I'm using
this driver...

Yours,
Linus Walleij
