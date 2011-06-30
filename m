Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcGYQ-0001Qa-0Y
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 12:41:11 +0000
Received: by vxd3 with SMTP id 3so1965938vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 05:41:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309435714.23597.181.camel@sauron>
References: <1309408494.10500.1.camel@phoenix>
	<BANLkTikonD2fcbkBU2ESYm_XncBXNZc_hw@mail.gmail.com>
	<1309435714.23597.181.camel@sauron>
Date: Thu, 30 Jun 2011 16:41:02 +0400
Message-ID: <BANLkTik-pWfbC3J9LkB-jL9H8cnoLR=R-Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: tmio_nand: fix build error
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Axel Lin <axel.lin@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/30/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-06-30 at 12:23 +0400, Dmitry Eremin-Solenikov wrote:
>> On 6/30/11, Axel Lin <axel.lin@gmail.com> wrote:
>> > Fix a mistake introduced by commit 33f4a3b
>> > "mtd: tmio_nand.c: use mtd_device_parse_register"
>>
>> Already sumbited 27 June 2011. Strangely Artem remains silent.
>
> I handle my mailbox in FIFO order (with exceptions) so I have not
> reached your patch yet. Now I've merged it with one of your previous
> patches to keep the kernel bisectable.

Thanks and sorry if my comment offended you! It's just I see most of
MLs/patches in threads, so I was a bit puzzled.

-- 
With best wishes
Dmitry
