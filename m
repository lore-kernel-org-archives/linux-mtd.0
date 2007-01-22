Date: Mon, 22 Jan 2007 09:13:05 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: OneNAND: Check first or second pages for bad block information
In-Reply-To: <3686708.94231169451196140.JavaMail.weblogic@ep_ml23>
Message-ID: <Pine.LNX.4.64.0701220912220.30741@pentafluge.infradead.org>
References: <3686708.94231169451196140.JavaMail.weblogic@ep_ml23>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2007-01-22 at 07:33 +0000, Kyungmin Park wrote:
> Hi,
>
> I'm not sure we have to check 2nd page. Yes, Spec. says we will check 
1st and 2nd ones.
>
> It increase the boot time even though it's smaller one than others.
>
Actually, if one is very concerned about BB scanning time, he should use 
on-flash BBT instead of in-memory BBT.

> Let me think, when we check 2nd page case.
> In initial bad, no need to check 2nd page.
> In runtime bad, it is only happend when first page write failed. But 
during write it has non-0xFF value. so next time it will be detected as 
invalid.
>
My understanding is that the second page is used only when the first one 
could not be written to due to some reasons - dunno which reasons.

So I wonder, how sane is it to read 1st page's OOB, and if no read errors 
detected - avoid reading the second one.
