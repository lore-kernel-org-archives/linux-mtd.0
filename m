Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUY33-0005Ae-7i
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 06:49:26 +0000
Received: by yenr9 with SMTP id r9so415729yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 23:49:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120512231350.347c16e9@halley>
References: <20120509132613.40db5533@pixies.home.jungo.com>
 <1336737075.2625.52.camel@sauron.fi.intel.com>
 <4FAEADF1.50308@newsguy.com> <20120512231350.347c16e9@halley>
Date: Tue, 15 May 2012 23:49:17 -0700
Message-ID: <CAN8TOE8yodhNvGF0ZafL7Jh3jb7B4KarWqk3iLUrrf4P2KTrrA@mail.gmail.com>
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, May 12, 2012 at 1:13 PM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Sat, 12 May 2012 11:37:37 -0700 Mike Dunn <mikedunn@newsguy.com> wrote=
:
>> On 05/11/2012 04:51 AM, Artem Bityutskiy wrote:
>> > From nand_base.c:
>> >
>> > =A0 =A0 if (mtd->ecc_stats.failed - stats.failed)
>> > =A0 =A0 =A0 =A0 =A0 =A0 return -EBADMSG;
>> >
>> > =A0 =A0 return =A0mtd->ecc_stats.corrected - stats.corrected ? -EUCLEA=
N : 0;
>> >
>> > - May drivers increment mtd->ecc_stats.{corrected,failed} during their
>> > =A0 ecc.read_oob() call?
>>
>> Currently no nand drivers increment stats.corrected for oob-only reads. =
=A0Since
>> nand_do_read_oob() does not read page data, stats never increment and -E=
UCLEAN
>> is never returned. =A0To avoid complicating the issue, I ignored the cas=
e of
>> reading oob-only.

My out-of-tree driver increments ecc_stats.corrected.

>> > - If so, can we (should we?) report EUCLEAN according to the
>> > =A0 bitflip_threshold in this case?
>>
>> I guess it depends on how widespread is the desire or capability of perf=
orming
>> ecc on oob-only reads. =A0The new diskonchip devices (docg3, docg4) are =
capable of
>> performing ecc on oob-only data. =A0These can do one bit corrections ove=
r 15 (of
>> the 16 total) oob bytes using the hamming algorithm (though neither driv=
er
>> supports it currently). =A0But since in this case only one bitflip can b=
e
>> corrected, it will always be below bitflip_threshold. =A0Then there's th=
e question
>> of how do you interpret uncorrectible bitflips vis-a-vis eraseblock heal=
th when
>> using a weaker ecc algorithm for oob-only.
>
> I see.
> So the current bitflip_threshold scheme is probably not applicable to
> 'nand_do_read_oob' - because the strength over the OOB would probably
> differ from the page's ECC strength.
>
>> These questions are currently all theoretical. =A0I think the threshold =
test
>> should be removed, and replaced with 'return 0', at least for now.
>
> Well, I was also surprised to see that 'nand_do_read_oob' may return
> EUCLEAN or EBADMSG at all.
>
> Digging further, I found out it was a relatively recent addition:
> [041e4575 mtd: nand: handle ECC errors in OOB] by Brian Norris.
>
> Brian, care to elaborate regarding 041e4575, and comment how do you
> think it should be ported to the new bitflip_threshold mechanism, if at
> all?

Hmm, well 041e4575 was designed without much of a window into how
others really needed it, as I didn't know of others who had the same
features. My hardware has its own threshold features that can be used
to mask bitflips; it has ECC that covers OOB at the same time as the
page data; when reading OOB only, it actually reads the page data as
well, in order to perform ECC properly. So when I report bitflips from
read_oob, I'm reporting the bitflips for the entire page+OOB sector.
But due to my hardware-based threshold, this only is reported for a
high number of bitflips.

So, I'm not sure how to properly reconcile the new threshold code, the
nand_do_read_oob() EUCLEAN and EBADMSG, and various schemes for
OOB-only ECC (or the common case of no ECC for OOB-only). I'll try to
give this some more thought and get back to you. But please comment if
my feedback so far stirs any ideas with you guys. Perhaps 041e4575 was
not as clean as I thought in the first place.

Brian
