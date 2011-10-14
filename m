Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdT4-0000wK-7O
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:50:14 +0000
Received: by wwg9 with SMTP id 9so547824wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 01:50:12 -0700 (PDT)
Message-ID: <4E97F7C2.1050803@gmail.com>
Date: Fri, 14 Oct 2011 10:50:10 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: erase block < 8KiB
References: <4E8977DF.1030808@gmail.com> <1318581933.12351.70.camel@sauron>
In-Reply-To: <1318581933.12351.70.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14/10/2011 10:45, Artem Bityutskiy wrote:
> On Mon, 2011-10-03 at 10:52 +0200, angelo wrote:
>    
>> Hi all,
>>
>> i read several mail about this limitation.
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2011-February/033851.html
>> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036498.html
>>
>>
>> I have a 4 KiB erase-size, common of some SST nor flash'es like mine
>> (SST 39VF3201B).
>>
>>   From all the posts i read here in the list, there seems not to be any
>> solution guaranteed.
>>
>> The tricky change to mkfs.jffs2 don't work for me. It seems to work for
>> small files, but i still get error messages copying a 600KB file in the
>> partition.
>> If it's true that the minimal jffs2 block is 4KB + some bytes, of course
>> the patch to mkfs.jffs2 can't work.
>>
>> Some one suggested the "virtual erase block" solution. I would like to
>> try to implement it, if i have the time.
>>
>> In any case, for the common users, is there maybe another flash file
>> system that can work with 4KiB erase size ?
>>      
> Just hack your driver and make it emulate larger eraseblocks and make
> JFFS2 happy. Should not be difficult.
>
>    

I already done this, and posted the patch for 64 KB sector.


But i none here still answered to the question :
why the cfi_cmdset_0002 selects for this flash the 4KB sector instead of 
the 64KB  ? In this way, the non-working of jffs2 is guaranteed, since 
the minimal block size is 4K + some bytes.

regards.
angelo
