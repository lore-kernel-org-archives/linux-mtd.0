Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkvYl-0004lJ-44
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 16:00:22 +0000
Subject: Re: UBIFS - strange behaviour after enabling chk_index
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <AM4PR0701MB213063EE7BE9DDE08ADAB177FEF10@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <adef444f-b333-4b2c-49d1-1bc08697a587@nod.at>
 <AM4PR0701MB21307808BDB62C97DB81DCD3FEF00@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <a381b47f-37ab-674a-b9e1-0ff50b84e065@nod.at>
Date: Fri, 16 Sep 2016 17:59:06 +0200
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB21307808BDB62C97DB81DCD3FEF00@AM4PR0701MB2130.eurprd07.prod.outlook.com>
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

Marcin,

On 15.09.2016 08:33, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
>> Is this the SPI-NOR device you talked about on IRC?
> Yes.

The one where you're facing issues after a power cut?

>> Maybe the check is broken, maybe it uncovers a hard to hit issue on your
>> flash. Both could be.
>>
>> Do you emulate exactly the same device in qemu?
> Yes, this part of HW is virtualized in Qemu, in fact the same SW build runs on Qemu and HW.
> Since it reproduce on both it allows to think that this is SW related (at least for now),
> but sure does not mean that this is UBI/UBIFS.
> 
> Back to problem, it seem that this could be a debug facility issue, since file system and data
> are not corrupted. If data on flash are correct (I have done many test and all passed,
> so currently I assume that drier is working properly), it could be that data in debug structure
> in this case are somehow outdated/bad (d->old_zroot).
> In test script, if I copy the same file twice (instead of three times) the problem does not
> reproduce. 
> I will try to debug this more, maybe you have any inside where to look?

I think chk_index exposes the power cut issue you told me on IRC.
For whatever reason the index corrupts on your flash. And chk_index
catches this very early.

Maybe there is an issue in the SPI-NOR code or UBI itself has trouble
with your flash (layout).

Thanks,
//richard
