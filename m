Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctXmi-0004vR-QU
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:58:34 +0000
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Amir Goldstein <amir73il@gmail.com>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
 <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
 <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
 <CAOQ4uxi0sJrZX22nNW23PnJ9AgzC=EeBOjOp=wb1taXSySYUrA@mail.gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "stable [v4.9]" <stable@vger.kernel.org>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <54320a7a-5022-732f-5a5d-5ec4ca5a4d9e@nod.at>
Date: Thu, 30 Mar 2017 12:51:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxi0sJrZX22nNW23PnJ9AgzC=EeBOjOp=wb1taXSySYUrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amir,

Am 30.03.2017 um 12:35 schrieb Amir Goldstein:
>> Reading deeper into the proved that I was wrong.
>> AFAIKT UBIFS' journal has currently no way to revive a deleted inode.
>> So, we have to think about a new solution.
>>
> 
> Not that I know anything about ubifs, but why do you need the deleted
> inode record in the first place for an O_TMPFILE.
> vfs ensures you that you can only link back an O_TMPFILE, not a deleted
> inode.
> 
> It does not appear to be the right thing to do to pass deletion=1 to
> ubifs_jnl_update(), but deletion=0 doesn't look right as well..

We need to think of a new case.
I choose deletion=1 to ensure that after a power-cut written data of the
tmpfile gets removed.

Thanks,
//richard
