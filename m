Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTWrI-0007RO-98
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 11:53:20 +0000
Received: by mail-ob0-f177.google.com with SMTP id wd20so1233777obb.36
 for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2012 04:53:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20121031032902.GD9475@thunk.org>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
 <20121029203937.GC7098@thunk.org>
 <CAC5umyhje4oDtKzw6kYSXw99rVzZJOaeApfizGeDos3SnmUcjA@mail.gmail.com>
 <CAC5umyi=f+Q2Dxc4KS8nKd8uD3yvVNf8M9g1-nBt+6UsqSGHdg@mail.gmail.com>
 <20121031032902.GD9475@thunk.org>
Date: Wed, 31 Oct 2012 20:53:19 +0900
Message-ID: <CAC5umyjO5t6VVeSQo0V=pA3HkZEzYfTg=iVhWRje5owBWXYC8g@mail.gmail.com>
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

2012/10/31 Theodore Ts'o <tytso@mit.edu>:
> On Tue, Oct 30, 2012 at 08:12:39PM +0900, Akinobu Mita wrote:
>> >>
>> >> How about prandom32_get_bytes_state() and prandom32_get_bytes() instead?
>> >
>> > I agree with your suggestion.  I'll rename them and try again.
>> >
>> > By the way, should we also rename the existing random32() and
>> > prandom32() in the future?
>
> I suppose the other way to go is to just use random32 as the common
> prefix, and just have random32() and random32_state().  My concern was
> that people might assume that prandom32() and random32() might imply
> that only prandom32() was the one using a pseudo-random number
> generator.  This might be easier since there are large number of uses
> of random32() in the source tree, but only a relative few using
> prandom32().

Using random32 as the common prefix sounds good idea.  I'm going to
prepare the following patch set:

[patch 1] rename prandom32 to randome32_state
[patch 2] introduce random32_get_bytes and random32_get_bytes_state
[patch 3-] proliferate random32_get_bytes and random32_get_bytes_state
