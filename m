Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RciJ9-00072E-BB
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 18:51:32 +0000
Received: by wera10 with SMTP id a10so1977842wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2011 10:51:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324134380.4240.40.camel@sauron.fi.intel.com>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
 <1323723000.2297.4.camel@koala>
 <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
 <20111213094805.04c4b8c9@pixies.home.jungo.com>
 <CAN8TOE_i=c3ysugu+_swbzi0B4abCYT0LJtLzJhQ8r_KMG8yRQ@mail.gmail.com>
 <1324134380.4240.40.camel@sauron.fi.intel.com>
Date: Mon, 19 Dec 2011 10:51:29 -0800
Message-ID: <CAN8TOE_vLdXHjND9SBZ8eEkpufMfCfO8dMUer3_xVOOErEgPYg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 17, 2011 at 7:06 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-12-14 at 12:46 -0800, Brian Norris wrote:
>> This is one of the problems. We would need to invalidate both BBTs in
>> step 1, making our attempts at mirroring pointless. In fact, in some
>> power cut cases, we could be left in a worse condition than if we
>> didn't try to compensate for power cuts, since we just killed our
>> backup table.
>
> I agree that it is not probably worth the effort, but would be nice to
> do, if someone has time and thinks this is useful. But I think it would
> be fair to request to add a comment which describes this hypothetical
> issue and this possible solution, would it?

Sure, I will add a comment, remove the option flag, and CC more
contributors (per your other recommendations) in a v2 patch.

Brian
