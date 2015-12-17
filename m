Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9YQp-0008UJ-6k
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 13:17:23 +0000
Received: by mail-oi0-x233.google.com with SMTP id l9so13653446oia.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2015 05:16:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMqctR=GGkb1bG3BXQQBn+5fF129-guGYOUDARDoNs2djJOWw@mail.gmail.com>
References: <2e8aa700cf3c4078a5d735dad29d1b1a@ServerDC.bittailors.com>
 <CAOMqctR=GGkb1bG3BXQQBn+5fF129-guGYOUDARDoNs2djJOWw@mail.gmail.com>
Date: Thu, 17 Dec 2015 14:16:57 +0100
Message-ID: <CAFLxGvxmaU8oo2uSBTYUvmp_aEpZBb2fKVdSFTEZKC=AMnUQKg@mail.gmail.com>
Subject: Re: UBI/UBIFS: md5sum of files go bad while running (no powercut)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Ralph Erdmann <rerdmann@bittailors.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 17, 2015 at 12:07 PM, Michal Suchanek <hramrach@gmail.com> wrote:
> Hello,
>
> On 17 December 2015 at 11:03, Ralph Erdmann <rerdmann@bittailors.com> wrote:
>> Dear all,
>> we encounter the following problem on some of our embedded boards in the field:
>> Some files "go bad" during runtime, which causes our application to crash.
>> A reboot "heals" this error.
>
> Is it possible that these libraries being used all the time by the
> application get cached in memory, get never evicted, and only the
> cached in-memory copy is bitrotten?

I'd also go in that direction.
Maybe something is corrupting your memory.
Does writing 2 to vm.drop_caches help?

-- 
Thanks,
//richard
