Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQvxo-00072V-HZ
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:14:25 +0000
Received: by mail-la0-f43.google.com with SMTP id gi9so5737129lab.16
 for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2014 03:14:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140908100453.GA28903@1wt.eu>
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <1410170318.10764.119.camel@sauron.fi.intel.com>
 <20140908100453.GA28903@1wt.eu>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 8 Sep 2014 12:13:39 +0200
Message-ID: <CACQ1gAgGPf1mWWiXEJxaHgM1SvVAAmE_dJiNwYsxxKPVbFETsg@mail.gmail.com>
Subject: Re: Ubi patch proposition for 3.10.y
To: Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Cc: jean-philippe francois <jp.francois@cynove.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-09-08 12:04 GMT+02:00 Willy Tarreau <w@1wt.eu>:
> Hi Artem,
>
> On Mon, Sep 08, 2014 at 12:58:38PM +0300, Artem Bityutskiy wrote:
>> On Fri, 2014-08-29 at 14:26 +0200, jean-philippe francois wrote:
>> > Hi,
>> >
>> > I think commit 4b3e0a25... [1] (UBI: Call scan_all() with correct
>> > offset in error case) should be added to 3.10.y stable branch.
>>
>> This is the "fastmap" fix, and fastmap is called experimental. We do not
>> have enough confidence it is production ready. Specifically, I'd like to
>> hear someone doing extensive power-cut testing with this feature. The
>> power-cut tolerance is one of the "selling features" of UBI/UBIFS, after
>> all.
>>
>> Therefore I never added fastmap fixes to the stable queue.
>>
>> But if someone is willing to put all the fastmap fixes together, add the
>> "stable tags" with the right kernel version "markings", and test for few
>> older kernels, then I will recommend them to be included to the stable.
>> Although I am not sure the stable maintainers would like accept them.
>>
>> But I do not recommend adding this single patch to the stable queue.
>>
>> But better, if people started paying more attention to "fastmap", we may
>> agree that from now on we are careful about the sending the fixes to the
>> stable queue.
>
> Personally, I think that whatever feature provided in a kernel release is
> subject to being used and deserves its fixes. There are some cases where
> we *know* that some features are not used (eg: when they don't work without
> a lot of patching or tweaking), but if they seem to work for end users, they
> are likely to be used.
>
> Just my two cents,
> Willy

And fastmap is a really sexy feature...
I couldn't resist adding it to my project.
We are not in production yet, but we will be soon.
For now, I'm letting end users playing with it. That's a good test usually :).

And for the record, I'm stuck with 3.14.18 for now, so I'll welcome
fixes on fastmap.


Richard.
