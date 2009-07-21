Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTDFY-0001Go-9X
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 11:11:17 +0000
Received: by qyk6 with SMTP id 6so703510qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jul 2009 04:11:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4A659ED4.9040702@gmail.com>
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>
Date: Tue, 21 Jul 2009 20:05:44 +0900
Message-ID: <9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
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

Hi

On Tue, Jul 21, 2009 at 7:56 PM, Artem Bityutskiy<dedekind1@gmail.com> wrote:
> Hi,
>
> On 07/21/2009 05:53 AM, Kyungmin Park wrote:
>>
>> At bootloader, we don't need to read full page. It takes too long time.
>> Instead it only read pages required for boot.
>>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>
> I do not understand the commit message. Could you please provide a better
> one which explains what the patch is really doing and why.

Right, the page means all blocks. It doesn't scan all blocks at boot
time. only some block contains kernel part are read and boot.

The goal is simple, Avoid double scanning at boot time. One time for
bootloader, Another is kernel.
As you know at bootloader, only load kernel in normal case. it means
we only read the kernel bad blocks and handle it.
and jump to the kernel. that's all

Thank you,
Kyungmin Park
