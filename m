Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0qh2-0005SZ-Um
 for linux-mtd@lists.infradead.org; Thu, 12 May 2016 13:30:21 +0000
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at> <20160511112630.GB22640@visteon-gnana>
 <573345F4.9070203@nod.at>
Cc: "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>,
 "babu3@visteon.com" <babu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57348554.6010805@nod.at>
Date: Thu, 12 May 2016 15:29:56 +0200
MIME-Version: 1.0
In-Reply-To: <573345F4.9070203@nod.at>
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

Am 11.05.2016 um 16:47 schrieb Richard Weinberger:
> Am 11.05.2016 um 13:16 schrieb DHANAPAL, GNANACHANDRAN (G.):
>> On Wed, May 11, 2016 at 11:22:15AM +0200, Richard Weinberger wrote:
>>> I had a brief look, the provided dump has more problems.
>>> The dent node with the bad type is not referenced by the journal,
>>> so we can ignore it for now.
>>> The worse problem is that the index references a lot of non-existing
>>> inodes.
> 
> BTW: Do both MTD tests and UBI tests pass?

Gave your issue another thought.
It is possible that you're facing bitflips in UBIFS meta data
which is not covered by the header CRC.
At least this would explain the corruption pattern you're facing.

Thanks,
//richard
