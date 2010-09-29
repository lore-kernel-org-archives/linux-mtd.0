Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0wHw-0005Ye-0j
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 13:01:37 +0000
Received: by fxm15 with SMTP id 15so515294fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 06:01:35 -0700 (PDT)
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <iwo@call-direct.com.au>
In-Reply-To: <4CA2B3E9.3030707@call-direct.com.au>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
	<1284308851.1783.23.camel@brekeke>
	<AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
	<1284358990.27765.154.camel@localhost>
	<AANLkTin4u=jQOxxuTwzMHrEEg=vDc2TSTah_=_Li02xx@mail.gmail.com>
	<1284441967.2084.18.camel@brekeke>
	<AANLkTin+2ocUT_NMToGHoAhX5=Trn2CdLFmiMBmvSVuC@mail.gmail.com>
	<1285139570.7512.137.camel@localhost>
	<AANLkTi=ssyUrvaic86hx8tT0TvZiMzyDa_KL0SfU144J@mail.gmail.com>
	<4CA2B3E9.3030707@call-direct.com.au>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 15:59:33 +0300
Message-ID: <1285765173.2437.123.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-29 at 13:35 +1000, Iwo Mergler wrote:
> The upshot of this is that blocks are marked as bad by the
> manufacturer based on corner case testing. Like erasing at
> high temperature / low voltage and reading back at low
> temperature / high voltage. The manufacturer can also
> access pads on the naked die that are not connected to pins
> during packaging.

Is only about letting you write to bad eraseblocks, not about erasing
them. I assumed this cannot be used for marking bad eraseblocks as good
back. The kernel does not have any protection against writing to bad
eraseblocks, so I do not see why Mike cannot have this option.

But speaking about erasing bad eraseblocks, which we also discussed, I
think you have a good point - we should probably distinguish between
factory-marked bad eraseblocks and user-marked. AFAIR, the OOB marker
for them was even different, or in BBT, do not really remember.

We probably can allow erasing user-marked bad eraseblocks and unmarking
them. But we probably should not allow erasing factory-marked bad
eraseblocks. But again, I'm not sure if it is possible to do, did not
really think about this.

But I think this particular patch from Mike is OK.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
