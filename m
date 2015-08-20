Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSO4j-0004E4-Sj
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 11:32:06 +0000
Message-ID: <1440070300.31419.202.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Thu, 20 Aug 2015 14:31:40 +0300
In-Reply-To: <55D542C5.6040500@cn.fujitsu.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-08-20 at 11:00 +0800, Dongsheng Yang wrote:
> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> > Currently UBIFS does not support direct IO, but some applications
> > blindly use the O_DIRECT flag.
> > Instead of failing upon open() we can do better and fall back
> > to buffered IO.
> 
> Hmmmm, to be honest, I am not sure we have to do it as Dave
> suggested. I think that's just a work-around for current fstests.
> 
> IMHO, perform a buffered IO when user request direct IO without
> any warning sounds not a good idea. Maybe adding a warning would
> make it better.
> 
> I think we need more discussion about AIO&DIO in ubifs, and actually
> I have a plan for it. But I have not listed the all cons and pros of
> it so far.
> 
> Artem, what's your opinion?

Yes, this is my worry too.

Basically, we need to see what is the "common practice" here, and
follow it. This requires a small research. What would be the most
popular Linux FS which does not support direct I/O? Can we check what
it does?

Artem.
