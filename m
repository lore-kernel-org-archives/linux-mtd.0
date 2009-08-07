Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZIHj-0001wi-K2
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 05:46:39 +0000
Received: by qw-out-1920.google.com with SMTP id 5so808266qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Aug 2009 22:46:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090807053020.GA902@linux-sh.org>
References: <20090804092046.16025.83910.sendpatchset@rx1.opensource.se>
	<9c9fda240908042124y4f783dfehd575601c0a09550e@mail.gmail.com>
	<aec7e5c30908042141l18b25ba4l66b3cb309f080b21@mail.gmail.com>
	<aec7e5c30908062228g737c1f6cr25f6c67c07d80bd9@mail.gmail.com>
	<20090807053020.GA902@linux-sh.org>
Date: Fri, 7 Aug 2009 14:46:34 +0900
Message-ID: <aec7e5c30908062246m2ef5b13dv57dd05bd07d23d67@mail.gmail.com>
Subject: Re: [PATCH] mtd: make onenand/generic.c more generic
From: Magnus Damm <magnus.damm@gmail.com>
To: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>,
	Kyungmin Park <kmpark@infradead.org>, linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
	dwmw2@infradead.org, akpm@linux-foundation.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 7, 2009 at 2:30 PM, Paul Mundt<lethal@linux-sh.org> wrote:
> On Fri, Aug 07, 2009 at 02:28:01PM +0900, Magnus Damm wrote:
>> On Wed, Aug 5, 2009 at 1:41 PM, Magnus Damm<magnus.damm@gmail.com> wrote:
>> >> On Tue, Aug 4, 2009 at 6:20 PM, Magnus Damm<magnus.damm@gmail.com> wrote:
>> >>> From: Magnus Damm <damm@igel.co.jp>
>> >>>
>> >>> This patch removes the ARM dependency from the generic "onenand"
>> >>> platform device driver. This change makes the driver useful for
>> >>> other architectures as well. Needed for the SuperH kfr2r09 board.
>> >
>> Any update on this?
>>
> You have failed at reading your email:
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026805.html
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026809.html

As usual, sorry about that. I'll solve that soon enough by signing off
with a different address.

/ magnus
