Received: from qw-out-1920.google.com ([74.125.92.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTRkI-0008IX-Rz
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 02:39:59 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1712079qwf.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jul 2009 19:39:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>
	<9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
Date: Wed, 22 Jul 2009 11:39:53 +0900
Message-ID: <9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>
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

Hi,

On Tue, Jul 21, 2009 at 8:05 PM, Kyungmin Park<kmpark@infradead.org> wrote:
> Hi
>
> On Tue, Jul 21, 2009 at 7:56 PM, Artem Bityutskiy<dedekind1@gmail.com> wrote:
>> Hi,
>>
>> On 07/21/2009 05:53 AM, Kyungmin Park wrote:
>>>
>>> At bootloader, we don't need to read full page. It takes too long time.
>>> Instead it only read pages required for boot.
>>>
>>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>> ---
>>
>> I do not understand the commit message. Could you please provide a better
>> one which explains what the patch is really doing and why.
>
> Right, the page means all blocks. It doesn't scan all blocks at boot
> time. only some block contains kernel part are read and boot.
>
> The goal is simple, Avoid double scanning at boot time. One time for
> bootloader, Another is kernel.
> As you know at bootloader, only load kernel in normal case. it means
> we only read the kernel bad blocks and handle it.
> and jump to the kernel. that's all
>

Experimental idea.
How about to integrate the bbt scan and ubi scan?

At ubi scan time. it scans all ubi blocks. In different from NAND,
OneNAND read main page and spare page both.
So if runtime badblock check enabled, read the page and check oob
first and if it's valid. use main page. If not, set it's badblock.
I'm not sure how much codes are modified. :)

How to you think?

Thank you,
Kyungmin Park
