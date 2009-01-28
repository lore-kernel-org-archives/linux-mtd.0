Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSDKB-0002ns-Vy
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2009 16:31:38 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from [IPv6:::1] ([74.59.45.108]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KE6009YHWJ7GFE0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 28 Jan 2009 11:30:44 -0500 (EST)
Message-id: <597DF9C7-178C-44D5-AAAB-5A47F32A2925@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: dedekind@infradead.org
In-reply-to: <1232961503.22350.89.camel@localhost.localdomain>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
Date: Wed, 28 Jan 2009 11:31:33 -0500
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1232961503.22350.89.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2009-01-26, at 4:18, Artem Bityutskiy wrote:
> we think we've fixed this bug. The reason was that when mounting RO,
> then re-mounting read-write, the orphan sub-system was not properly
> initialized. The fix is available at the ubifs-v2.6.28.git tree. I've
> back-ported all stable changes and fixes to the tree. You need this  
> fix:
>
> commit b3718eedf4ab91307f64a79ad8eb911ca401bd22
> Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Date:   Mon Jan 26 10:55:40 2009 +0200
>
>    UBIFS: ensure orphan area head is initialized
>
>    When mounting read-only the orphan area head is
>    not initialized.  It must be initialized when
>    remounting read/write, but it was not.  This patch
>    fixes that.
>
>    [Artem: sorry, added comment tweaking noise]
>    Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
>    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>
> Please, send us some feed-back about whether your problem has been
> solved.

Hi Artem,

I've patched my kernel with ubifs-v2.6.28.git and it seems to be  
working perfectly!

Thanks a lot to you and Adrian.

Best Regards,
-david
