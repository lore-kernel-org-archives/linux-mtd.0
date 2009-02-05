Received: from rv-out-0708.google.com ([209.85.198.248])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LV0gD-0004oC-Cg
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 09:37:56 +0000
Received: by rv-out-0708.google.com with SMTP id b17so176281rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Feb 2009 01:37:51 -0800 (PST)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
In-Reply-To: <49895FFC.4020600@nokia.com>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
	<6b5362aa0902030235t4175ec11re9b6335df558e6a@mail.gmail.com>
	<49895FFC.4020600@nokia.com>
Date: Thu, 5 Feb 2009 15:07:51 +0530
Message-ID: <6b5362aa0902050137j3f6581d6s192224ca445a7b5a@mail.gmail.com>
Subject: Re: Regarding UBI scalability
From: Brijesh Singh <brij.singh@samsung.com>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 4, 2009 at 2:59 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Brijesh Singh wrote:
>>
>> On Tue, Feb 3, 2009 at 5:14 AM, Corentin Chary <corentin.chary@gmail.com>
>> wrote:
>>>
>>> On Mon, Feb 2, 2009 at 12:18 PM, Adrian Hunter
>>> <ext-adrian.hunter@nokia.com> wrote:
>>>>
>>>> Artem Bityutskiy wrote:
>>>>>
>>>>> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
>>>>>>
>>>>>> I would suggest an intermediate step.  Create UBI2 which is
>>>>>> similar to UBI but stores eraseblock information in one place,
>>>>>> instead of at the beginning of each eraseblock.  Such an approach
>>>>>> might be OK up to as much as 64GiB, and would probably perform
>>>>>> better than a fully scalable version.
>>>>>>
>>>>>> Then look at creating UBI3, which is fully scalable.
>>>>>
>>>>> Yes, I assume UBI2 should store mapping/erasure information in separate
>>>>> tables, not in each eraseblock. So we should get rid of eraseblock
>>>>> headers.
>>>>
>>>> Yes that is what I meant.  You could probably make do with as little as
>>>> 12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
>>>> would need 1536KiB table, which could be read in a second or two, so
>>>> mount time is OK.
>>
>> Adrian,to my understanding, this is minimum info needed per physical
>> erase block...
>>
>> Erase count                   -8 bytes
>> Lnum                             -4 bytes
>> Volume ID                      -4 byte(Can make it 1 byte for now as
>> vol limit=128)
>> Header CRC                   -4 bytes(Only for static volumes.)
>> i.e. Minimum 20 bytes.  Is there any other way to make it 12?
>
> 8 bytes for erase counter is many more than needed i.e.
>        SLC NAND 100,000 - 1,000,000 max. erase cycles
>        MLC NAND 10000 - 10,000 max. erase cycles
>
> Leave out the header CRC for dynamic volumes
>
> Combine lnum and volume id.
>
> Maybe go so far as to pack the information into bit fields
> like LPT does. i.e. if the flash media only has a million
> eraseblocks then only 20 bits are needed for lnum.  Maybe it
> is MLC NAND, so say 15 bits for erase counter.  That leaves 5
> bites for volume id, and fits into 5 bytes for dynmaic volumes.

Makes sense.

>> And how to update the table relatively efficiently?
>
> Each update to UBI typically requires writing a whole NAND
> page.  That page can be filled with unchanged information
> from the first eraseblock of UBI information.  Hence after
> enough updates the first eraseblock will end up containing
> only out-of-date information and can then be unmapped.

Does it mean there is no separate commit block?And do we move the
journal with valid entries when it is full?

I find some problems with it.
1) Why process extra information for each write?
2) We will need to scan the entire journal for each mount.
3) Will work well with only NAND.

Instead, if there is a separate commit block, this can be read once
and processed.

I was wondering, how about combining both the approaches. i.e. A
commit block and journal as you suggested?Commit time will be reduced
dramatically.(As One page now contains group info). And boot time will
be fixed for good unmounts. Besides, it is simple and can be easily
scaled.

Best Regards,
Brijesh
