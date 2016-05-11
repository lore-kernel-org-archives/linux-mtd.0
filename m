Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0QLp-0002Bd-MT
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 09:22:43 +0000
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
Cc: "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>,
 "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5732F9C7.6020206@nod.at>
Date: Wed, 11 May 2016 11:22:15 +0200
MIME-Version: 1.0
In-Reply-To: <20160511073836.GA22640@visteon-gnana>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 11.05.2016 um 09:29 schrieb DHANAPAL, GNANACHANDRAN (G.):
> On Wed, May 11, 2016 at 12:22:23PM +0530, Gnanachandran Dhanapal wrote:
>> On Tue, May 10, 2016 at 06:48:24PM +0200, Richard Weinberger wrote:
>>> Am 10.05.2016 um 16:49 schrieb DHANAPAL, GNANACHANDRAN (G.):
>>>> Thanks for the reply, Richard. 
>>>> Please find two files in google drive share.
>>>>
>>>> 	1. dump_mtd7_ecc.log   - /dev/mtd7 dump with ecc
>>>> 	2. leb_peb_map_22706.log   - LEB to PEB map. This information is taken by having print in table.
>>>>
>>>> Share:
>>>> 	https://drive.google.com/open?id=0B7tYZDLZ_KAZMFd4MENlQkJuNjA
>>>
>>> Hmm, the share contains only log files.
>>> I need a pristine dump of your NAND (created by nanddump without OOB data) to analyze the issue.
>>>
>>> Thanks,
>>> //richard
>>
>> Sorry Richard, The file name or its extension "dump_mtd7_ecc.log" might be confusing. but actually this file was created using 
>> command "nanddump /dev/mtd7 -f dump_mtd7_ecc.log". This file of size 510MB.
>>
>> dump_mtd7_ecc.log MD5SUM 	= 5b04c52f992036047d426fa07691429e
>> 		  SHA256SUM 	= 28a36d3fc28c18adc29be66525c1a28e68143937ec43be425ee942d3375c17a6
>>
>> Please let me know if you have any issue accessing the file.

Ahh, .log for a dump file, creative naming. ;-)

I had a brief look, the provided dump has more problems.
The dent node with the bad type is not referenced by the journal,
so we can ignore it for now.
The worse problem is that the index references a lot of non-existing
inodes.

Is this a pristine UBIFS with all fixes applied?
Your kernel is rather old. Not sure if we ever had such an issue,
but still...
Can you please explain a bit more what your device is doing and what
NAND/UBI layout you are using?

Thanks,
//richard
