Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAUMx-0004Gf-7J
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2015 03:09:12 +0000
Message-ID: <567619ED.8080006@cn.fujitsu.com>
Date: Sun, 20 Dec 2015 11:01:01 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <david@sigma-star.at>
Subject: Re: [PATCH 05/11] ubifs: remove ununsed ubifs context from key helpers
References: <1446290160-30696-1-git-send-email-richard@nod.at>	
 <1446290160-30696-6-git-send-email-richard@nod.at>	
 <5636BC3D.5000200@cn.fujitsu.com> <1446478715.6126.109.camel@gmail.com>
In-Reply-To: <1446478715.6126.109.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/02/2015 11:38 PM, Artem Bityutskiy wrote:
> On Mon, 2015-11-02 at 09:28 +0800, Dongsheng Yang wrote:
>> Yes, all ubifs_info *c in key.h are not used, But I am
>> not sure about is that intentional or not.
>
> Hi,
>
> the intention was that there would be multiple key formats supported,
> and these functions would look at something like c->key_format to
> figure out how to work with this key.

Thanx Artem,

Then, David and Richard, what about keep this parameter here for
scalability?

I would like to add a comment about it to point out what is that for.

Yang
>
> Right now there is only one key type, so these are not needed as of
> today.
>
> Artem.
>
