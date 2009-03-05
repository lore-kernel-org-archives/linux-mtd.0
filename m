Received: from rv-out-0708.google.com ([209.85.198.250])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf4UF-00065A-LR
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 03:43:10 +0000
Received: by rv-out-0708.google.com with SMTP id k29so3545105rvb.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Mar 2009 19:43:06 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20090304155544.3bc3f337.akpm@linux-foundation.org>
References: <20090303063605.GA30258@july>
	<20090303124948.dda294e5.akpm@linux-foundation.org>
	<49AE6907.1080702@nokia.com>
	<20090304085055.c9de6cbb.akpm@linux-foundation.org>
	<9c9fda240903041547x540899f9hd94cbf49baac660b@mail.gmail.com>
	<20090304155544.3bc3f337.akpm@linux-foundation.org>
Date: Thu, 5 Mar 2009 12:43:06 +0900
Message-ID: <9c9fda240903041943m483db3f4i3c40c6970ef16fce@mail.gmail.com>
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
From: Kyungmin Park <kmpark@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	AMIT KUMARSHARMA <amitsharma.9@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: h.rohit@samsung.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Mar 5, 2009 at 8:55 AM, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Thu, 5 Mar 2009 08:47:03 +0900
> Kyungmin Park <kmpark@infradead.org> wrote:
>
>> I think we know the issues currently and then if the device is opened,
>> handle this one if required.
>> How do you think?
>
> I think it would be prudent to fix the known problems now, rather
> than having to go through and re-debug them later on.
>
> Bear in mind that people frequently copy old code when writing
> new code, so these things tend to propagate, creating more work
> later on.
>

Agree,

To Amit,

Could you fix it and send a patch please.
Also can you reduce the left shift operation to resolve it permanently

Thank you,
Kyungmin Park
