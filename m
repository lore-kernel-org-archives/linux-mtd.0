Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxeSV-0005EG-Dt
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 18:22:24 +0000
Subject: Re: [PATCH 15/26] ubifs: Implement encrypt/decrypt for all IO
To: Michael Halcrow <mhalcrow@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-16-git-send-email-richard@nod.at>
 <20161021171439.GA17121@google.com>
 <78f09113-fcc3-c2d2-9849-ba980cd9c0b4@nod.at>
 <20161021175202.GA20642@google.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 tytso@mit.edu, jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de,
 sbabic@denx.de, dengler@linutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <ccfd1997-8010-3e0f-36ab-e5e360e50564@nod.at>
Date: Fri, 21 Oct 2016 20:21:16 +0200
MIME-Version: 1.0
In-Reply-To: <20161021175202.GA20642@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.10.2016 19:52, Michael Halcrow wrote:
> On Fri, Oct 21, 2016 at 07:21:04PM +0200, Richard Weinberger wrote:
>> On 21.10.2016 19:14, Michael Halcrow wrote:
>>> Compress-before-encrypt is a hazard.
>>>
>>> http://www.iacr.org/cryptodb/archive/2002/FSE/3091/3091.pdf
>>
>> I'm fully aware of that. But as usual it depends on the use case.
>> Compression is optional in UBIFS, paranoid users can disable it
>> when encryption is enabled.
> 
> It's not the paranoid users I'm concerned about.  It's those building
> systems with complexity and nuance on top of UBIFS who aren't paranoid
> enough.
> 
> I suggest disabling compression by default when encryption is enabled,
> unless the user explicitly enables both.

That's definitely an option, yes.

Thanks,
//richard
