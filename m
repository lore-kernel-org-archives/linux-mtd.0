Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSmB3-0000Dp-Vb
	for linux-mtd@lists.infradead.org; Sat, 04 Jun 2011 08:25:50 +0000
Received: by vxd2 with SMTP id 2so2474546vxd.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Jun 2011 01:25:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307116515.3069.24.camel@localhost>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307116515.3069.24.camel@localhost>
Date: Sat, 4 Jun 2011 12:25:45 +0400
Message-ID: <BANLkTi==kBwqeJLMRzA_VXJ58sky7FE_gg@mail.gmail.com>
Subject: Re: [RFC PATCH 000/104] mtd: cleanup partition parsing interface
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/3/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
>> Hello,
>>
>> This is an RFC for a huge serie of patches converting most mtd drivers to
>> use
>> single instance of code for managing mtd partitions parsing and handling.
>>
>> Currently each driver responsible for partitions implements this part of
>> code
>> on it's own, resulting in memory leaks, possible frees of non-allocated
>> memory,
>> etc. As the patch serie is huge, I'm posting only patches I consider
>> "interesting", i. e. from the subserie doing the same cleanup for
>> different
>> drivers I post only first patch. Rest are available through the gitweb.
>>
>> Only one driver still uses parse_mtd_partitions after this serie
>> (edb7312),
>> as it registers both parsed partitions and the whole mtd device and I
>> ain't
>> sure how to behave at this case.
>>
>> If the idea seems find to be commited, I'll post the whole serie for full
>> review.
>
> Hi, sure this is interesting. I'll try to find time and go through this
> and push to l2 tree. But then please, ping dwmw2 to look at this,
> because otherwise it will not get to linux-next till the end of the next
> merge window.

I'll then rebase this on top of l2 tree and post a formal pull request
with both you and dwmw2 in cc. Is this fine from your point of view?

-- 
With best wishes
Dmitry
