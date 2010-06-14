Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOEHq-000500-Fp
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 18:21:31 +0000
Received: by gwj18 with SMTP id 18so3069283gwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jun 2010 11:21:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100614112213.695ac5d2@wker>
References: <1276371338-14253-1-git-send-email-agust@denx.de>
	<AANLkTikutI1bWUpG4FDWwwKOGSEfik-ycZZLs37AjDtK@mail.gmail.com>
	<20100614112213.695ac5d2@wker>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 14 Jun 2010 14:21:08 -0400
Message-ID: <AANLkTilYAgKHkOkfw4rTlS1SbWvRs99fC-Wwa7jutUEM@mail.gmail.com>
Subject: Re: [PATCH v3] mtdchar: fix mmap() for MTD RAM/ROM char devices
To: Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 14, 2010 at 05:22, Anatolij Gustschin wrote:
> On Sat, 12 Jun 2010 21:31:11 -0400 Mike Frysinger wrote:
>> On Sat, Jun 12, 2010 at 15:35, Anatolij Gustschin wrote:
>> > For no-mmu systems mmap() on RAM/ROM devices already works
>> > but for systems with mmu it probably was not tested and
>> > currently doesn't work.
>>
>> nope, never did
>
> Do you mean it never worked on mmu systems?

it probably wasnt tested too heavily if at all
-mike
