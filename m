Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa58O-0004AJ-3Y
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 15:51:08 +0000
Received: by mail-ig0-f182.google.com with SMTP id hn18so2813530igb.9
 for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2014 08:50:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412350035.3795.101.camel@sauron.fi.intel.com>
References: <1412089998-18978-1-git-send-email-tlinder@codeaurora.org>
 <1412350035.3795.101.camel@sauron.fi.intel.com>
Date: Fri, 3 Oct 2014 17:50:46 +0200
Message-ID: <CACna6ryws=d_7NXhzWyu34TaV+Yv8y0+D4Q0ewuzDEv=8xDxRg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 3 October 2014 17:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Yes, I guess a single patch is indeed OK. I have few nit-picks, though.
>
> On Tue, 2014-09-30 at 18:13 +0300, Tanya Brokhman wrote:
>> -             ubi_err("'ubi_io_read_ec_hdr()' returned unknown code %d", err);
>> +             ubi_err(ubi,
>> +               "'ubi_io_read_ec_hdr()' returned unknown code %d", err);
>>               return -EINVAL;
>
> I think it is fine if the line is long in these cases, let's keep the
> message on the same line, this split does not contribute to better
> readability, quite the opposite, in my opinion.
>
> One line:
> ubi_err(ubi, "long line")
>
> Multiple lines:
> ubi_err(ubi, "long line,
>         parameters)

You should discuss that with checkpatch team, because ARAIR it will
complain about "long line" with any other parameter in the same line.
