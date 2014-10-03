Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa5lg-0006AA-Hl
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 16:31:44 +0000
Received: by mail-ig0-f182.google.com with SMTP id hn18so2976903igb.3
 for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2014 09:31:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412353168.10105.5.camel@sauron.fi.intel.com>
References: <1412089998-18978-1-git-send-email-tlinder@codeaurora.org>
 <1412350035.3795.101.camel@sauron.fi.intel.com>
 <CACna6ryws=d_7NXhzWyu34TaV+Yv8y0+D4Q0ewuzDEv=8xDxRg@mail.gmail.com>
 <1412353168.10105.5.camel@sauron.fi.intel.com>
Date: Fri, 3 Oct 2014 18:31:21 +0200
Message-ID: <CACna6rxRRaE8_rmdoJ-RuFWaf6y_UL++nmyovKQGC7L46tPN5g@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Tanya Brokhman <tlinder@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 October 2014 18:19, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2014-10-03 at 17:50 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 3 October 2014 17:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > Yes, I guess a single patch is indeed OK. I have few nit-picks, though=
.
>> >
>> > On Tue, 2014-09-30 at 18:13 +0300, Tanya Brokhman wrote:
>> >> -             ubi_err("'ubi_io_read_ec_hdr()' returned unknown code %=
d", err);
>> >> +             ubi_err(ubi,
>> >> +               "'ubi_io_read_ec_hdr()' returned unknown code %d", er=
r);
>> >>               return -EINVAL;
>> >
>> > I think it is fine if the line is long in these cases, let's keep the
>> > message on the same line, this split does not contribute to better
>> > readability, quite the opposite, in my opinion.
>> >
>> > One line:
>> > ubi_err(ubi, "long line")
>> >
>> > Multiple lines:
>> > ubi_err(ubi, "long line,
>> >         parameters)
>>
>> You should discuss that with checkpatch team, because ARAIR it will
>> complain about "long line" with any other parameter in the same line.
>
> I respect checkpatch.pl, and uniformity / consistency, but in this
> particular case I put my maintainer hat on and say that for this kernel
> subsystem it is fine, because the maintainer will be more efficient in
> maintaining this code when the code is a bit mere readable for him.

I'm fine with that :) I think it may be even worth bringing to the
checkpatch / CodingStyle to allow such lines.

--=20
Rafa=C5=82
