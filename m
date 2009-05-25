Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8bh9-0007ap-1O
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 15:02:37 +0000
Received: by fxm8 with SMTP id 8so3764180fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 08:02:29 -0700 (PDT)
Message-ID: <4A1AB2FA.5030906@gmail.com>
Date: Mon, 25 May 2009 19:02:18 +0400
From: Vladimir Barinov <vova.barinov@gmail.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] MXC NAND support for 2k page size flashes
References: <1243242377-4470-1-git-send-email-vbarinov@embeddedalley.com>
	<1243258164.21646.123.camel@localhost.localdomain>
In-Reply-To: <1243258164.21646.123.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: maramaopercheseimorto@gmail.com, s.hauer@pengutronix.de,
	lilja.magnus@gmail.com, lanconelli.claudio@eptar.com,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-05-25 at 13:06 +0400, Vladimir Barinov wrote:
>   
>> - Add support for 2k page size flashes
>> - Fix page address access for large pages
>> - Detect oob layout at runtime
>> - handle pagesize_2k variable
>> - Fix oob16 layout: reserve location 5 of oob area since it's used for bbt
>> ---
>>  drivers/mtd/nand/mxc_nand.c |   60 ++++++++++++++++++++++++++++++++++++------
>>  1 files changed, 51 insertions(+), 9 deletions(-)
>>     
>
> I've added this to my git tree. You did not provide your signature,
> but I assume you have just forgotten about this and have added it for
> you:
>
> Signed-off-by: Vladimir Barinov <vova.barinov@gmail.com>
>   
Oops, sorry for that
