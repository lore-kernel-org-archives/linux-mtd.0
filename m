Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lmqwe-0004gh-0v
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 14:52:43 +0000
From: "Singh, Vimal" <vimalsingh@ti.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Date: Thu, 26 Mar 2009 20:21:33 +0530
Subject: RE: Is high_memory check in omap2.c for OneNAND is sufficient?
Message-ID: <19F8576C6E063C45BE387C64729E73940427A869EB@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E73940427A869DA@dbde02.ent.ti.com>,
	<49C8FFCA.1010703@nokia.com>
	<19F8576C6E063C45BE387C64729E73940427A869DB@dbde02.ent.ti.com>,
	<49CA0AC4.9030702@nokia.com>
	<19F8576C6E063C45BE387C64729E73940427A869E7@dbde02.ent.ti.com>,
	<49CB3938.9010207@nokia.com>
	<19F8576C6E063C45BE387C64729E73940427A869EA@dbde02.ent.ti.com>,
	<49CB42EF.2080908@nokia.com>
In-Reply-To: <49CB42EF.2080908@nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Andrian... this helped me a lot...
________________________________________
From: Adrian Hunter [adrian.hunter@nokia.com]
Sent: Thursday, March 26, 2009 2:25 PM
To: Singh, Vimal
Cc: linux-mtd@lists.infradead.org
Subject: Re: Is high_memory check in omap2.c for OneNAND is sufficient?

ext Singh, Vimal wrote:
> From: Adrian Hunter [adrian.hunter@nokia.com]
>> Singh, Vimal wrote:
>>> From: Adrian Hunter [adrian.hunter@nokia.com]
>>>> Singh, Vimal wrote:
>>>>> From: Adrian Hunter [adrian.hunter@nokia.com]
>>>>>> Singh, Vimal wrote:
>>>>>>> There is check for 'high_memory' in 'drivers/mtd/onenand/omap2.c', =
always before doing 'dma_map_single'.
>>>>>>> Snippet:
>>>>>>> ----------------------
>>>>>>>         if (buf >=3D high_memory) {
>>>>>>>                 struct page *p1;
>>>>>>> ----------------------
>>>>>>> This check seems not sufficient. There should be a check for upper =
boundary too.
>>>>>>> Thinking scenario when 'buf' is less than 'high_memory', but somewh=
ere near to it, and 'count' is big enough to beyond 'high_memory'.
>>>>>> AFAIK it is not possible to allocate memory that crosses the high_me=
mory boundary.
>>>>> Do you mean 'buf' can not cross 'high_memory' boundary?
>>>> Yes.
>>> If so, then I wonder why above check is present in code...
>>>
>> Which check?
>>
>
> I mean, if 'buf' can cross 'high_memory' boundary then why do we nedd "if=
 (buf >=3D high_memory)" check and re-manipulating 'buf' in code (in driver=
s/mtd/onenand/omap2.c).
>
> I am really confuse now... when this particular condition will occur.
>
>

buf can be below high_memory but in that case buf + count cannot be high_me=
mory or above.

The addresses below high_memory are mapped differently to those above high_=
memory.

If you kmalloc, you get an address below high_memory.

If you vmalloc, you get an address above high_memory.

Never does a memory allocation cross above and below high_memory.

That is my understanding (on OMAP at least), but I am far from a guru, so p=
lease correct me if I am wrong.

>>>>> But then I have seen a case where it was crossing that and BUG was re=
ported by function 'dma_cache_maint'.
>>>> Is it possible that 'buf' or 'count' is wrong?
>>> I do not think so...
>>>
>
>
>
