Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctZB4-0002J5-IV
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 12:27:48 +0000
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
 <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
 <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
 <646ae733-5037-3072-7151-b055a8fa1521@intel.com>
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com,
 stable@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <cbaff214-7431-2cd1-2453-156d716c0d8a@nod.at>
Date: Thu, 30 Mar 2017 14:27:21 +0200
MIME-Version: 1.0
In-Reply-To: <646ae733-5037-3072-7151-b055a8fa1521@intel.com>
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

Am 30.03.2017 um 13:57 schrieb Adrian Hunter:
>> Reading deeper into the proved that I was wrong.
>> AFAIKT UBIFS' journal has currently no way to revive a deleted inode.
>> So, we have to think about a new solution.
> 
> Deleting the orphan looks right.  Just need to understand whether the
> recovery would do the right thing - actually it looks like O_TMPFILE might
> be OK and in other case we might be failing to remove nodes with sequence
> numbers greater than the deletion inode.

Sadly it does not the right thing.
I'm currently investigating why and how to deal with it.

I also managed to trigger that case. :(

Thanks,
//richard
