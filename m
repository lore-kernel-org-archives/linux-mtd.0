Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDy20-0000xd-Pm
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 14:44:38 +0000
Message-ID: <521B69BB.6000808@nod.at>
Date: Mon, 26 Aug 2013 16:44:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: Fastmap and Atmel sam-ba
References: <CACQ1gAgOS5kpykb1jxnRJUNCmdC1jwmmWr5cQ7aazKVvMjBPWQ@mail.gmail.com>
 <CACQ1gAj2bNOnnCqLjALW0LiXYiDw_CTYUTgsE4Jd5pH9DkWadA@mail.gmail.com>
 <5217B101.3040306@nod.at>
 <CACQ1gAjAV-5PX_-YD7JR5uSeaXaUEu1KofLsoeZq+j=64DyifA@mail.gmail.com>
In-Reply-To: <CACQ1gAjAV-5PX_-YD7JR5uSeaXaUEu1KofLsoeZq+j=64DyifA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.08.2013 11:31, schrieb Richard Genoud:
> 2013/8/23 Richard Weinberger <richard@nod.at>:
>> Hi again,
>>
>> I have an idea what's going on. As you are using a real (and rather slow) NAND device
>> erasing PEBs takes some time.
>> If you attach the very first time from an image created by ubinize UBI has to erase
>> all PEBs, parallel to that UBIFS requests one PEB but does not get one.
>> In this case UBI has to erase one PEB in sync-mode.
>>
>> I have only nandsim, which is far to fast to hit that bug.
>> Who wants to donate me a board with NAND memory? ;-)
>>
>> Anyway, can you please test the attached patch?
> To answer your previous question, yes, I see the issue every time
> (i.e. I can never boot)
> 
> I tried your patch, and it worked ! Good catch !
> 
> Tried it with ubi.fm_autoconvert=0, every thing works fine.
> 
> With ubi.fm_autoconvert=1, I see this at the 1st boot (It boots fine):
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    1.273437] UBI: scanning is finished
> [    1.296875] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.304687] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.304687] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.312500] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.320312] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.328125] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.328125] UBI: max/mean erase counter: 0/0, WL threshold: 4096,
> image sequence number: 1933127782
> [    1.335937] UBI: available PEBs: 306, total reserved PEBs: 1658,
> PEBs reserved for bad PEB handling: 40
> [    1.343750] UBI: background thread "ubi_bgt0d" started, PID 352
> [    1.421875] UBI error: ubi_update_fastmap: could not find any anchor PEB
> [    1.429687] UBI warning: ubi_update_fastmap: Unable to write new
> fastmap, err=-28

The problem here is that the ubinized image uses all 64 anchor PEBs (0 to 63) for data
and fastmap has to move data first to get a free anchor PEBs.
Maybe I find a way to perform this task faster/better.

But IMHO the best thing is adding fastmap support to ubinize.

Thanks,
//richard
