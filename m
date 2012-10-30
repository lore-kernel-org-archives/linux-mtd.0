Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TT9ZA-00052L-Dy
 for linux-mtd@lists.infradead.org; Tue, 30 Oct 2012 11:01:06 +0000
Received: by mail-oa0-f49.google.com with SMTP id l10so99277oag.36
 for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2012 04:01:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20121029203937.GC7098@thunk.org>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
 <20121029203937.GC7098@thunk.org>
Date: Tue, 30 Oct 2012 20:01:01 +0900
Message-ID: <CAC5umyhje4oDtKzw6kYSXw99rVzZJOaeApfizGeDos3SnmUcjA@mail.gmail.com>
Subject: Re: [PATCH 1/9] random32: introduce random32_get_bytes() and
 prandom32_get_bytes()
From: Akinobu Mita <akinobu.mita@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Akinobu Mita <akinobu.mita@gmail.com>,
 linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/10/30 Theodore Ts'o <tytso@mit.edu>:
> On Sun, Oct 28, 2012 at 04:18:58PM +0900, Akinobu Mita wrote:
>>  /**
>> + *   prandom32_get_bytes - get the requested number of pseudo-random bytes
>> + *   @state: pointer to state structure holding seeded state.
>> + *   @buf: where to copy the pseudo-random bytes to
>> + *   @bytes: the requested number of bytes
>> + *
>> + *   This is used for pseudo-randomness with no outside seeding.
>> + *   For more random results, use random32_get_bytes().
>> + */
>> +
>> +/**
>> + *   random32_get_bytes - get the requested number of pseudo-random bytes
>> + *   @buf: where to copy the pseudo-random bytes to
>> + *   @bytes: the requested number of bytes
>> + */
>
> This naming scheme is going to be very confusing.  If the function is
> going to return a pseudo-random number, it *must* have a "prandom"
> suffix.  Otherwise some kernel developer, somewhere, will get confused
> between get_random_bytes() and random32_get_bytes(), and the result
> may be a very embarassing security exposure.
>
> How about prandom32_get_bytes_state() and prandom32_get_bytes() instead?

I agree with your suggestion.  I'll rename them and try again.

By the way, should we also rename the existing random32() and
prandom32() in the future?

Specifically, rename random32() to prandom32(), and prandom32() to
prandom32_state().  As a result, it will cause a little confusion
between old and new prandom32(). But the number of arguments will
be changed from 3 to 2, so gcc can detect the misuse of prandom32().

Is there any other idea of renaming? Or should we keep them as is?
