Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC7Zf-0003pa-UB
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 09:50:24 +0000
Received: by qyl38 with SMTP id 38so4235235qyl.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 02:50:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=DHTjL7M9bzYY-t5MJS2s1WScBCQ@mail.gmail.com>
References: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
	<1301900656.2760.6.camel@localhost>
	<BANLkTi=WTWa4yj+ysta8jiHs9r4MX5Gf_g@mail.gmail.com>
	<1301911604.2760.52.camel@localhost>
	<BANLkTi=DHTjL7M9bzYY-t5MJS2s1WScBCQ@mail.gmail.com>
Date: Tue, 19 Apr 2011 11:50:20 +0200
Message-ID: <BANLkTinysw90tiWhFRmQH_0LWx7o+sD1-A@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Use empty_iops and empty_fops consistently
From: Sedat Dilek <sedat.dilek@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Jens Axboe <jaxboe@fusionio.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: sedat.dilek@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 4, 2011 at 12:29 PM, Sedat Dilek <sedat.dilek@googlemail.com> wrote:
> On Mon, Apr 4, 2011 at 12:06 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Mon, 2011-04-04 at 11:38 +0200, Sedat Dilek wrote:
>>> Sorry for having flooded your inbox.
>>
>> That's ok! :-) I think I did not look carefully enough. Your patch is
>> just an additional clean-up which makes the names to be consistent. I
>> can pick it, but probably it is better if it goes in with the
>> 'empty_aops' changes? Whatever you prefer.
>>
>
> I dunno the internal organization between block-tree and fs-sub-tree
> maintainers.
> As I was in contact first with Jens in this issue, it might be a good
> idea to let this patch go through his block-tree.
>
> - Sedat -
>

Hi Artem,

can you take this patch into your UBIFS tree?
Thanks in advance.

- Sedat -
