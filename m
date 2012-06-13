Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sebes-00010M-8z
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 00:42:03 +0000
Received: by yhjj52 with SMTP id j52so127668yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2012 17:42:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1339497736.2401.24.camel@sauron.fi.intel.com>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
Date: Tue, 12 Jun 2012 17:42:00 -0700
Message-ID: <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading its
 version
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 12, 2012 at 3:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-06-10 at 22:59 -0700, Brian Norris wrote:
>> On Sun, Jun 10, 2012 at 3:58 AM, Shmulik Ladkani
>> <shmulik.ladkani@gmail.com> wrote:
>> > - Not runtime tested.
>>
>> Patch looks fine, but this makes me curious: does anyone use
>> NAND_BBT_ABSPAGE? It looked broken to me when I tried it not too long
>> ago, but I didn't look too deeply. (I doubt that this typo was its
>> only problem, but I may try again...)
>
> Looks like this is used in diskonchip.c.

Hmm, OK. This driver seems to be very stale (very few real
fixes/improvements in git history). Anyone know if diskonchip.c even
works with the current BBT code?

I retried NAND_BBT_ABSPAGE on my own driver, and it seems that this
code-path has no ability to *create* a bad block table where one
didn't exist previously. It simply reads whatever data is present at
the given page(s) (according to td->pages[]), regardless of ECC
errors, junk data, lack of BBT markers (i.e., "Bbt0" or "1tbB"), and
versioning.

So when I use NAND_BBT_ABSPAGE with an erased block at page 1024, I
get the following:

   Bad block table at page 1024, version 0xFF

And no blocks are detected bad (simply because there was 0xff "table
data"). But then, I get even worse results if the uninitialized BBT
block has arbitrary (non-0xff) data! nand_bbt would just mark random
blocks as bad...

So, this "feature" seems severely limited - designed for a somewhat
static, pre-initialized BBT. I can probably survive by continuing to
ignore this eyesore, but I'd rather just fix it or kill it.

Brian
