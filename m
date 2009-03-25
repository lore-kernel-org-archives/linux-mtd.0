Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmUXs-0005nA-Js
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 14:57:49 +0000
From: "Singh, Vimal" <vimalsingh@ti.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Date: Wed, 25 Mar 2009 20:24:46 +0530
Subject: RE: Is high_memory check in omap2.c for OneNAND is sufficient?
Message-ID: <19F8576C6E063C45BE387C64729E73940427A869E7@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E73940427A869DA@dbde02.ent.ti.com>,
	<49C8FFCA.1010703@nokia.com>
	<19F8576C6E063C45BE387C64729E73940427A869DB@dbde02.ent.ti.com>,
	<49CA0AC4.9030702@nokia.com>
In-Reply-To: <49CA0AC4.9030702@nokia.com>
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


From: Adrian Hunter [adrian.hunter@nokia.com]
>Singh, Vimal wrote:
>> From: Adrian Hunter [adrian.hunter@nokia.com]
>>> Singh, Vimal wrote:
>>>> There is check for 'high_memory' in 'drivers/mtd/onenand/omap2.c', alw=
ays before doing 'dma_map_single'.
>>>> Snippet:
>>>> ----------------------
>>>>         if (buf >=3D high_memory) {
>>>>                 struct page *p1;
>>>> ----------------------
>>>> This check seems not sufficient. There should be a check for upper bou=
ndary too.
>>>> Thinking scenario when 'buf' is less than 'high_memory', but somewhere=
 near to it, and 'count' is big enough to beyond 'high_memory'.
>>> AFAIK it is not possible to allocate memory that crosses the high_memor=
y boundary.
>>
>> Do you mean 'buf' can not cross 'high_memory' boundary?
>
>Yes.
If so, then I wonder why above check is present in code...

>
>> But then I have seen a case where it was crossing that and BUG was repor=
ted by function 'dma_cache_maint'.
>
>Is it possible that 'buf' or 'count' is wrong?
I do not think so...
