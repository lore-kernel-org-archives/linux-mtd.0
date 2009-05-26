Received: from mail-gx0-f163.google.com ([209.85.217.163])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M95yd-0004lw-U2
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 23:22:48 +0000
Received: by gxk7 with SMTP id 7so1154890gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 May 2009 16:22:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090526231902.GA6295@linux-sh.org>
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
	<1243331191-11445-2-git-send-email-vapier@gentoo.org>
	<20090526113122.GB16835@linux-sh.org>
	<8bd0f97a0905260942m4b574d75oc4f38ee3d8849395@mail.gmail.com>
	<20090526164735.GA24261@linux-sh.org>
	<8bd0f97a0905260950i6da64210n7da256627d3e38ff@mail.gmail.com>
	<20090526170653.GB24261@linux-sh.org>
	<8bd0f97a0905261024q178fbc80n4a997daca5a3b405@mail.gmail.com>
	<20090526231902.GA6295@linux-sh.org>
Date: Tue, 26 May 2009 19:22:34 -0400
Message-ID: <8bd0f97a0905261622s5a5bd2ddj5e087e2fbcb91c57@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/maps: uclinux: support Blackfin systems
From: Mike Frysinger <vapier.adi@gmail.com>
To: Paul Mundt <lethal@linux-sh.org>, linux-kernel@vger.kernel.org,
	uclinux-dist-devel@blackfin.uclinux.org, Greg Ungerer <gerg@uclinux.org>,
	uclinux-dev@uclinux.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 26, 2009 at 19:19, Paul Mundt wrote:
> On Tue, May 26, 2009 at 01:24:46PM -0400, Mike Frysinger wrote:
>> On Tue, May 26, 2009 at 13:06, Paul Mundt wrote:
>> > Use the attached, and then just set uclinux_ram_map.phys = your_address_here
>> > in your setup_arch(). Having weak symbols in drivers that are supposed to
>> > be overriden by the architecture code is just way too backwards for
>> > words. Globals suffice fine for this sort of thing, if you are not going
>> > to go to the effort to pass this information to the driver directly that
>> > is.
>>
>> i was thinking something else, but obviously this is nicer than what i
>> was thinking
>
> Unfortunately there is the problem that the map driver itself is a
> tristate, so if this is built as a module, the symbol will not be
> available to you. On the other hand, if it doesn't need to ever really be
> a module, converting it to a bool ought to be workable. There are no
> in-tree users that enable this as a module anyways.

weaks would address that, but there is no real point as you say.  it
isnt like the rootfs image gets loaded as part of the module loading.
i'll send a patch for that too.  the Blackfin code all depends on
CONFIG_MTD_UCLINUX, so the rootfs area wouldnt be setup anyways if it
were built as a module ...
-mike
