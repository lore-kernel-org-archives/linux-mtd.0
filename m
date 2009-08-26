Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgEgI-0003NB-VJ
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 09:20:43 +0000
Message-ID: <4A94FE48.4040104@gmail.com>
Date: Wed, 26 Aug 2009 12:20:08 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: JiSheng Zhang <jszhang3@gmail.com>
Subject: Re: About UBI2
References: <2df346410908260207g32a0d368i8953aacb2655f542@mail.gmail.com>
In-Reply-To: <2df346410908260207g32a0d368i8953aacb2655f542@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/26/2009 12:07 PM, JiSheng Zhang wrote:
> Hi list,
>
> I want to improve ubi attach time, I have read the faq of ubi, it
> seems that once ubi2 is implemented, the attach time will be very
> good.

Depends on how you implement it.

> My question is Under ubi2, if ubifs is unmounted unclean, is
> there need to scan all EBs?

Sure not, otherwise it would be crap, not UBI2.

> Is there any news or ideas of UBI2?

No. We had some discussions in this list, and Adrian Hunter briefly
suggested an UBI->UBI2->UBI3 plan, where UBI2 would solve mount time
issues, but not issue of the linear dependency of memory consumption
and flash size (no one really complained about this, and this issue
is not that severe).

Also Samsung people were doing some research, you may ask them. Goole
the mtd list archives.

If you seriosly interested, you should allocate half a year project time
(at least) and just do this :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
