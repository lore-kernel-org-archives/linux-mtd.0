Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MUU0u-0004Nt-7o
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 23:17:24 +0000
Received: by qyk6 with SMTP id 6so2645163qyk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jul 2009 16:17:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4A69D3BE.7070900@gmail.com>
References: <20090721025303.GA3693@july> <4A69D3BE.7070900@gmail.com>
Date: Sat, 25 Jul 2009 08:17:17 +0900
Message-ID: <9c9fda240907241617v64be8d38gc70a86c210ab0a7f@mail.gmail.com>
Subject: Re: [PATCH] OneNAND: Runtime badblock check support
From: Kyungmin Park <kmpark@infradead.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 25, 2009 at 12:31 AM, Artem Bityutskiy<dedekind1@gmail.com> wrote:
> On 07/21/2009 05:53 AM, Kyungmin Park wrote:
>>
>> At bootloader, we don't need to read full page. It takes too long time.
>> Instead it only read pages required for boot.
>>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>
> I still did not get it, why you change boot-loader behavior by patching
> the kernel. Or you use the kernel as a bootloader?

Since code consistency. I also send a same patch to u-boot.
actually u-boot OneNAND code are almost same as kernel one.

>
> Also, the mtd-2.6.git tree does not havemtd/onenand/samsung.c

Right, samsung.c is for s3c64xx and s5pc100 SoCs. I will send it after
more tests.

>
> Anyway, could you please re-send the patch with a nice description, for
> silly people like me :-)

Sure.

Thank you,
Kyungmin Park
