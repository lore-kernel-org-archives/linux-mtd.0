Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW4iz-0001C8-CN
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 11:22:45 +0000
Message-ID: <4ED7636E.7010307@newsguy.com>
Date: Thu, 01 Dec 2011 03:22:22 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/5] mtd api changed to return bitflips on read operations
References: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>	
 <20111129144042.1979a587@skate> <1322730506.2332.30.camel@koala>
In-Reply-To: <1322730506.2332.30.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/01/2011 01:08 AM, Artem Bityutskiy wrote:
> On Tue, 2011-11-29 at 14:40 +0100, Thomas Petazzoni wrote:
>> Also, another option is to allow max_bitflips to be NULL, which would
>> simplify things such as :
> Yes, I vote for this solution.


Yes, this was an dumb oversight on my part.  Will implement this as well.

I replied to Thomas' post, but the reply was flagged for human review by the ML
due to "suspicious header".  Probably because I had to read the original post
from the ML archives and paste it into my post because Thomas' post never made
it to my inbox for some reason.  Having email problems...


>> Another question: is the max_bitflips information sufficient (i.e on a
>> large read with multiple pages, you will only get the value for the
>> worst page) ? Don't you need the bitflip count on a per-page basis ?
> I do not think we need accurate per-page information.
>
>


My thought as well.

Should the patchset be combined into one patch?  Are separate, interdependent
patches ill-advised?

Thanks,
Mike
