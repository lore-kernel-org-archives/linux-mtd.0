Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGj9f-0004Nv-4H
 for linux-mtd@lists.infradead.org; Sat, 25 Jun 2016 08:41:32 +0000
Subject: Re: [PATCH] UBI: only read UBI_VID_HDR_SIZE when reading the vid_hdr
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <1466688561-16103-1-git-send-email-s.hauer@pengutronix.de>
 <576BF461.2020108@nod.at> <20160623150631.GG20657@pengutronix.de>
 <576BFD36.8090702@nod.at> <20160624061037.GH20657@pengutronix.de>
 <20160624093957.528c48dc@bbrezillon>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576E43A3.5000708@nod.at>
Date: Sat, 25 Jun 2016 10:41:07 +0200
MIME-Version: 1.0
In-Reply-To: <20160624093957.528c48dc@bbrezillon>
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

Am 24.06.2016 um 09:39 schrieb Boris Brezillon:
> On Fri, 24 Jun 2016 08:10:37 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
>> On Thu, Jun 23, 2016 at 05:16:06PM +0200, Richard Weinberger wrote:
>>> Am 23.06.2016 um 17:06 schrieb Sascha Hauer:  
>>>>>>  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
>>>>>>  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
>>>>>> -			  ubi->vid_hdr_alsize);
>>>>>> +			  UBI_VID_HDR_SIZE);  
>>>>>
>>>>> Hmm, I fear this will break as soon ubi->vid_hdr_shift is non-zero.  
>>>>
>>>> Ok, just tried and indeed it does break. Would it be an option to read
>>>> UBI_VID_HDR_SIZE + ubi->vid_hdr_shift bytes instead?  
>>>
>>> Well, you need to satisfy the trick UBI does.
>>> Please read the huge comment on it on top of io.c.
>>>
>>> Since in most cases ubi->vid_hdr_shift is 0 we could also do a fast path.
>>> i.e.
>>> if (ubi->vid_hdr_shift)
>>> 	read_len = ubi->vid_hdr_alsize
>>> else
>>> 	read_len = UBI_VID_HDR_SIZE;  
>>
>> Yes. I thought reading UBI_VID_HDR_SIZE + ubi->vid_hdr_shift has the
>> advantage that even with vid_hdr_shift != 0 we can profit from reading
>> subpages. I tested it with a vid hdr offset of 512 and it works ok.
>>
>>>
>>> But first I have to review a view call sites. :-)  
>>
>> Yes, please. It lowers the chance that I break the kernel ;)
>>
>>>
>>> Can you tell a bit more on the NAND you're facing that speedup?
>>> I find it surprising that you gain a full second.
> 
> Not so surprising to me. I tried the same trick on a 16k page NAND a
> while a ago, and it drastically decreased the attach time (don't recall
> the exact numbers).

I assumed it will give you only on large pages (as found on MLC NAND)
a speedup.

Thanks,
//richard
