Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebv0i-0004HP-0S
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 21:12:41 +0000
Received: by mail-wr0-x242.google.com with SMTP id o7so20393002wro.8
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2018 13:12:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2774377.VZm18AqBqi@blindfold>
References: <20171129204317.91205-1-ebiggers3@gmail.com>
 <20180105183744.GA44929@gmail.com> <2774377.VZm18AqBqi@blindfold>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 17 Jan 2018 22:12:27 +0100
Message-ID: <CAFLxGvzGeMkm_1HhcFDe4twTGsVHaXvjoM6GezxtCNW+NZw84Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ubifs: switch to new fscrypt helper functions
To: Richard Weinberger <richard@nod.at>
Cc: Eric Biggers <ebiggers3@gmail.com>, linux-fscrypt@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 5, 2018 at 11:11 PM, Richard Weinberger <richard@nod.at> wrote:
> Eric,
>
> Am Freitag, 5. Januar 2018, 19:37:44 CET schrieb Eric Biggers:
>> On Wed, Nov 29, 2017 at 12:43:12PM -0800, Eric Biggers wrote:
>> > From: Eric Biggers <ebiggers@google.com>
>> >
>> > This series switches ubifs to use the fscrypt helper functions for
>> > open/link/rename/lookup/setattr introduced in v4.15.
>> >
>> > These patches were originally sent in "[PATCH 00/25] fscrypt: add some
>> > higher-level helper functions".  I've rebased them onto v4.15-rc1.
>> >
>> > Eric Biggers (5):
>> >   ubifs: switch to fscrypt_file_open()
>> >   ubifs: switch to fscrypt_prepare_link()
>> >   ubifs: switch to fscrypt_prepare_rename()
>> >   ubifs: switch to fscrypt_prepare_lookup()
>> >   ubifs: switch to fscrypt_prepare_setattr()
>> >
>> >  fs/ubifs/dir.c  | 43 +++++++++++++------------------------------
>> >  fs/ubifs/file.c | 41 ++++-------------------------------------
>> >  2 files changed, 17 insertions(+), 67 deletions(-)
>>
>> Richard, can you take these for UBIFS for v4.16?
>
> Yes. Thanks a lot for cleaning this up.

FYI, this series has merge conflicts with other fscrypt related
changes that went via Ted into fs/ubifs.

-- 
Thanks,
//richard
