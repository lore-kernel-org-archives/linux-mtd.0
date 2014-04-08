Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXYR2-0007hi-Ts
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 15:59:42 +0000
Received: by mail-oa0-f54.google.com with SMTP id n16so1238724oag.41
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 08:59:19 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <1396968207.30750.17.camel@sauron.fi.intel.com>
References: <20140408044407.GA13141@www.outflux.net>
 <20140408135729.GC2429@arch.cereza>
 <1396968207.30750.17.camel@sauron.fi.intel.com>
Date: Tue, 8 Apr 2014 08:59:19 -0700
Message-ID: <CAGXu5j+-1o9TmqLrq2ZPhoRvOmiv4Do5wvGkasxHb+Frm7hutA@mail.gmail.com>
Subject: Re: [PATCH] ubi: avoid workqueue format string leak
From: Kees Cook <keescook@chromium.org>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 8, 2014 at 7:43 AM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> On Tue, 2014-04-08 at 10:57 -0300, Ezequiel Garcia wrote:
>> Hello Kees,
>>
>> Thanks for the patch.
>>
>> On Apr 07, Kees Cook wrote:
>> > When building the name for the workqueue thread, make sure a format
>> > string cannot leak in from the disk name.
>> >
>>
>> Could you enlighten me and explain why you want to avoid the name leak?
>> Is it a security concern?
>>
>> I'd like to understad this better, so I can avoid making such mistakes
>> in the future.
>
> Well, the basics seem to be simple, attacker makes sure gd->disk_name
> contains a bunch of "%s" and other placeholders, and this leads
> "workqueue_alloc()" to read kernel memory and form the workqueue name.

Right. I don't think there is an actual exploitable vulnerability
here, but it's a best-practice to not pass variable strings in as a
potential format string.

> I did not think it through further, though, but that was enough for me
> to apply the patch right away. But yeah, curios parts are:
>
> 1. How attacker could end up with a crafted "gd->disk_name"

At present, the only way I know how to set that is via some special
controls in md, but I assume that would not work via ubi.

> 2. How attacker gets the workqueue name then, I guess there is a sysfs
> file or something, but I do not know off the top of my head.

This I haven't checked, but if there isn't a way to do it now, we can
at least avoid a nasty surprise in the future if one is created. :)

> Yeah, I am interested to get educated on this a too.

Thanks for pulling the fix!

-Kees

-- 
Kees Cook
Chrome OS Security
