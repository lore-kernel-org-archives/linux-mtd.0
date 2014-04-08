Received: from mail-ve0-f174.google.com ([209.85.128.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXeLR-0001Wx-HH
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 22:18:18 +0000
Received: by mail-ve0-f174.google.com with SMTP id oz11so1373906veb.33
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 15:17:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1396964636.26672.66.camel@sauron.fi.intel.com>
References: <1396339305-16005-1-git-send-email-tlinder@codeaurora.org>
 <1396964546.26672.65.camel@sauron.fi.intel.com>
 <1396964636.26672.66.camel@sauron.fi.intel.com>
Date: Wed, 9 Apr 2014 00:17:50 +0200
Message-ID: <CAFLxGvxDpggGAPu2rVz-KLkHS1KoQNqU-DOJ=xubVinFn68VEw@mail.gmail.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Free peb's synchronously for fastmap
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tlinder@codeaurora.org" <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 8, 2014 at 3:44 PM, Bityutskiy, Artem
<artem.bityutskiy@intel.com> wrote:
> On Tue, 2014-04-08 at 16:42 +0300, Artem Bityutskiy wrote:
>> On Tue, 2014-04-01 at 11:01 +0300, Tanya Brokhman wrote:
>> > At first mount it's possible that there are not enough free PEBs since
>> > there are PEB's pending to be erased. In such scenario, fm_pool (which is
>> > the pool from which user required PEBs are allocated) will be empty.
>> > Try fixing the above described situation by synchronously performing
>> > pending erase work, thus produce another free PEB.
>> >
>> > Signed-off-by: Tatyana Brokhman <tlinder@codeaurora.org>
>>
>> Pushed to linux-ubifs.git / master, thanks!
>
> Oh, sorry, this one I actually _dropped_. Would you please rather
> re-structure the code to avoid duplication. E.g., do what Richard
> suggested.

Tatyana, can you also please find out how many PEBs you need?
Strictly speaking we need only one (which should be produced by __wl_get_peb().
I want to make sure that we're not just papering over an issue. :-)

-- 
Thanks,
//richard
