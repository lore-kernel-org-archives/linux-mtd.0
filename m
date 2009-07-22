Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTWw4-0008SS-2c
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 08:12:29 +0000
Message-ID: <4A66CA03.5000406@nokia.com>
Date: Wed, 22 Jul 2009 11:12:51 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: UBI FS mounting time
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>	
	<4A66B547.6020207@nokia.com>	
	<71cd59b00907220012pe8200e6od143f2561501bd0f@mail.gmail.com>	
	<4A66C209.7060305@nokia.com>
	<71cd59b00907220057s6dbbdcb0vc23526836939aa97@mail.gmail.com>
In-Reply-To: <71cd59b00907220057s6dbbdcb0vc23526836939aa97@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Bosi Daniele <Daniele.Bosi@mta.it>, Brijesh Singh <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corentin Chary wrote:
> On Wed, Jul 22, 2009 at 9:38 AM, Adrian Hunter<adrian.hunter@nokia.com> wrote:
>> Corentin Chary wrote:
>>> On Wed, Jul 22, 2009 at 8:44 AM, Adrian Hunter<adrian.hunter@nokia.com>
>>> wrote:
>>>> Bosi Daniele wrote:
>>>>> We have a UBI+UBIFS 1GB partition on a NAND chip, which takes around 6s
>>>>> to
>>>>> mount.
>>>>>
>>>>> We'd like to have the data available at least read-only earlier than
>>>>> that.
>>>>>
>>>>> We know UBI on principle needs to read the map of all blocks in order to
>>>>> rebuild the logical view of the memory, but maybe there's another way
>>>>> around
>>>>> it to make it available earlier...
>>>>>
>>>>> Someone know how?
>>>> Some options are:
>>>>
>>>>
>>>> a) Use another smaller partition that can mount first and provide some
>>>> functionality while the larger partition mounts.
>>>> b) Reduce the number of eraseblocks by combining them into larger logical
>>>> blocks.
>>>> c) Change UBI to write its mapping table when it is unloaded, so it can
>>>> be
>>>> read quickly when loading (still have to scan if UBI was not unloaded
>>>> cleanly).
>>> Do you know if someone is trying to implement that ?
>> Not that particular approach.  Some Samsung people have looked at
>> creating a scalable version of UBI.
>>
>>> I did some test, and using lzo/zlib it should be possible to store
>>> such a mapping
>>> store in only one PEB.
>>> Then we can choose this PEB to be near the beginning of the
>>> flash to speed up scanning (using ec and pnum to calculate a "score").
>>> This is also possible to use an "anchor".
>> Yes, it is better to use anchor blocks.  Probably just one is enough if
>> it is only updated twice per mount.
> 
> Do you think it would be better to fix the position of the anchor
> (first 2 good peb,
> ideally 0 and 1), or try to get a "good" position using ec and pnum ?
> 
> With a fixed position at the beginning, the scan process would be easier,
> because there is no need to reset if we find the anchor after normal blocks.
> But is does not sound very "wear leveling".

I would fix the anchor block in the first good PEB and use just one.
If you lose power while erasing the anchor then you have to scan,
but you have to scan anyway if you lose power, so there is not much
difference.
