Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP7Cz-0006CZ-ON
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 11:59:38 +0000
Received: by mail-oi0-x242.google.com with SMTP id d204so4282123oig.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 04:59:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxpB-sAS4tsZu4fFVp4OxGdg1nccip-y6fh-V1ffdXQdQ@mail.gmail.com>
References: <1468833493-28311-1-git-send-email-zajec5@gmail.com>
 <CAFLxGvxpB-sAS4tsZu4fFVp4OxGdg1nccip-y6fh-V1ffdXQdQ@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 18 Jul 2016 13:59:15 +0200
Message-ID: <CACna6ry-AdRH9Yk02piJoc0N4VSWom=_N4dE9_-NDjV4gQQi4g@mail.gmail.com>
Subject: Re: [PATCH mtd-utils] nanddump: check write function result for errors
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 July 2016 at 13:33, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Mon, Jul 18, 2016 at 11:18 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:
>> Errors may happen, it's e.g. easy on embedded devices to run out of spac=
e
>> when dumping big partitions. This patch adds a helper function for
>> writing. It deals with partial writes and just returns 0 on success or
>> error number.
>>
>> The old code didn't check for errors at all which could result in
>> incomplete dumps without exiting with an error.
>
> Is this patch different from my version, does it fix more?
> http://lists.infradead.org/pipermail/linux-mtd/2016-April/067234.html
>
> Brian, if this is fine with you I'd apply one of these patches.

I wasn't aware of your patch, having it accepted would save me some
time for sure.

Two minor advantages I see in my version:
1) It handles partial writes, just retries if only some part of buffer
has been written
2) It displays error number and string which may provide some extra
hint to the user

In my case (when I was running out of space), the successful last
write was partial because there wasn't enough space for the whole
buffer. I needed to retry a write to get a real error code.

--=20
Rafa=C5=82
