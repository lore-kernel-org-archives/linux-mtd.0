Received: from haggis.mythic-beasts.com ([2a00:1098:0:86:1000:0:2:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9ZOz-0004fo-5d
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 15:24:02 +0000
From: Luis Henriques <henrix@camandro.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: add missing iounmap() in error path
References: <20161116225016.29958-1-henrix@camandro.org>
 <20161122192124.GF77253@google.com>
Date: Wed, 23 Nov 2016 15:22:04 +0000
In-Reply-To: <20161122192124.GF77253@google.com> (Brian Norris's message of
 "Tue, 22 Nov 2016 11:21:24 -0800")
Message-ID: <87a8cq9q77.fsf@camandro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> On Wed, Nov 16, 2016 at 10:50:16PM +0000, Luis Henriques wrote:
>> This patch was triggered by the following Coccinelle error:
>>=20
>> ./drivers/mtd/maps/sc520cdp.c:246:3-9: \
>> 	ERROR: missing iounmap; ioremap on line 242 \
>> 	and execution via conditional on line 244
>>=20
>> Signed-off-by: Luis Henriques <henrix@camandro.org>
>> ---
>>  drivers/mtd/maps/sc520cdp.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
>> index 093edd51bdc7..7a27ed345d0d 100644
>> --- a/drivers/mtd/maps/sc520cdp.c
>> +++ b/drivers/mtd/maps/sc520cdp.c
>> @@ -243,6 +243,10 @@ static int __init init_sc520cdp(void)
>>=20=20
>>  		if (!sc520cdp_map[i].virt) {
>>  			printk("Failed to ioremap_nocache\n");
>> +			if (i) {
>> +				while (--i)
>
> Umm, so you never unmap from sc520cdp_map[0].virt? How about:
>
> 				while (--i >=3D 0)
>
> ?
>
> You can also skip the 'if (i)' part in that case. Or maybe make it a for
> loop, to be even clearer.
>
>> +					iounmap(sc520cdp_map[i].virt);
>
> This may often be a double-iounmap. If you take a look later in the
> loop, many instances of the loop may not find a device, and so they'll
> unmap this memory and move on. You're just doing it a second time for
> them.
>
>> +			}
>>  			return -EIO;
>>  		}
>>=20=20
>
> Please put some more care into your patch, since I very much expect that
> you did not test it.
>
> Brian

Thank you very much for your review.  All very good points indeed!
I'll try to send v2 soon to cover all the issues you've found.

Cheers,
--=20
Lu=C3=ADs
