Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7h8F-0004fZ-GT
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 07:29:08 +0000
Received: by mail-vc0-f173.google.com with SMTP id id13so805796vcb.32
 for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2013 00:28:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376032991.2219.122.camel@sauron.fi.intel.com>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
 <520357DF.3030403@freescale.com>
 <20130808230630.GA14434@norris.computersforpeace.net>
 <1376020723.2219.105.camel@sauron.fi.intel.com>
 <52048565.1030707@gmail.com>
 <1376032991.2219.122.camel@sauron.fi.intel.com>
Date: Fri, 9 Aug 2013 00:28:44 -0700
Message-ID: <CAN8TOE_GzzXcsifQOiD1WbgXKJmXkJjBbUfgv88Oit95oaY18g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 vikram186@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 9, 2013 at 12:23 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2013-08-08 at 23:00 -0700, Brian Norris wrote:
>> On 08/08/2013 08:58 PM, Artem Bityutskiy wrote:
>> > There are few minor issues in aiaiai, which I can fix if you hit them
>> > and complain. Also, I did not invest much time in making the user
>> > interface and experience very nice. But this can also be improved.
>>
>> One issue (possibly related to the above question?) was that aiaia
>> complained (via checkpatch.pl) about no sign-offs when I processed using
>> the input redirection method on a multi-message mbox.
>
> Yes, aiaiai runs checkpatch.pl for individual patches, and then to a
> concatenated patch, and the latter does not have a signed-off-by. Fixing
> is about adding --no-signoff to the right place.

I can look at that if I run into it again and have the time to fix it.

> I am a bit worried that at some point we may screw each other's work by
> pushing things out at the same time. We should be very careful with
> --force.

I think by limiting our use of rebase and exercising care with
--force, we should be fine. And if we do a 'fetch' just before, then
the probability of a collision should be pretty low. Famous last
words.

Brian
