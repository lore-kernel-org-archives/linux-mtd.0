Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTmmW-0007XZ-53
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 08:07:04 +0000
Message-ID: <55DACF2B.1020207@cn.fujitsu.com>
Date: Mon, 24 Aug 2015 16:00:43 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>, Artem Bityutskiy
 <dedekind1@gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
 <55D5BC92.8050903@nod.at> <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com> <20150824075324.GA28336@infradead.org>
 <1440403362.15510.39.camel@gmail.com> <20150824080350.GA17815@infradead.org>
In-Reply-To: <20150824080350.GA17815@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/24/2015 04:03 PM, Christoph Hellwig wrote:
> On Mon, Aug 24, 2015 at 11:02:42AM +0300, Artem Bityutskiy wrote:
>> Back when we were writing UBIFS, we did not need direct IO, so we did
>> not implement it. But yes, probably someone who cares could just try
>> implementing this feature.
>
> So I think the answer here is to implement a real version insted of
> adding hacks to pretend it is supported.

Actually, I had a plan for it. But it's for 4.4 or 4.5 in my plan.

Yang
> .
>
