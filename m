Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeMso-0006a6-VY
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 05:41:55 +0000
Message-ID: <4A8E3381.9090508@gmail.com>
Date: Fri, 21 Aug 2009 08:41:21 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Aras Vaichas <arasv@magellan-technology.com>
Subject: Re: ubifs mount problem: UBIFS error (pid 1152): validate_sb: bad
	superblock, error 8
References: <ed62800908192059g57e85893ga352793e52c43a65@mail.gmail.com>	<4A8D2F10.1050902@nokia.com>
	<ed62800908201905nc1bd812u7f3c0f67bc01ef23@mail.gmail.com>
In-Reply-To: <ed62800908201905nc1bd812u7f3c0f67bc01ef23@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	MTD-LIST <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/21/2009 05:05 AM, Aras Vaichas wrote:
> Yes, that works.
>
> I see my problem now. From mkfs.ubifs.c:
>
>          /* Make the journal about 12.5% of main area lebs */
>          c->max_bud_bytes = (lebs / 8) * (long long)c->leb_size;
>          /* Make the max journal size 8MiB */
>          if (c->max_bud_bytes>  8 * 1024 * 1024)
>              c->max_bud_bytes = 8 * 1024 * 1024;
>          if (c->max_bud_bytes<  4 * c->leb_size)
>              c->max_bud_bytes = 4 * c->leb_size;
>
> The journal size is calculated based on the maximum FS size.
> This means that the *minimum" ubifs size is a function of the
> *maximum* UBIFS size.  Interesting.

:-) Well, you may specify the size you want explicitly.

> I chose an 8MB partition because I'm doing a lot of testing for a
> factory/production flashing system, so I don't want to wait long while
> I go through lots of erase/write/attach/mount cycles. Since this is
> unusual, I won't worry too much about it.

You may create another image for this.

> Would there be a benefit to set a small fixed journal size, regardless
> of UBIFS maximum size, for embedded systems?

May be. We did not experiment much with the journal size. If you could
benchmark different journal sizes for different volume sizes and show
what would that small fixed journal size be, we could do what you suggest,
I think.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
