Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUN0O-0003mk-QI
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 15:48:24 +0000
Message-ID: <4A69D79F.7020105@gmail.com>
Date: Fri, 24 Jul 2009 18:47:43 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Daniel Mack <daniel@caiaq.de>
Subject: Re: ubifs: error unwinding trouble
References: <20090724103038.GN19257@buzzloop.caiaq.de>
	<4A6991A5.4020105@nokia.com> <1248437866.24676.79.camel@localhost>
	<20090724154600.GR19257@buzzloop.caiaq.de>
In-Reply-To: <20090724154600.GR19257@buzzloop.caiaq.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/24/2009 06:46 PM, Daniel Mack wrote:
> On Fri, Jul 24, 2009 at 03:17:46PM +0300, Artem Bityutskiy wrote:
>> On Fri, 2009-07-24 at 13:49 +0300, Adrian Hunter wrote:
>>> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
>>> index 0f2034c..e4d9ef0 100644
>>> --- a/drivers/mtd/ubi/eba.c
>>> +++ b/drivers/mtd/ubi/eba.c
>>> @@ -1254,6 +1254,7 @@ out_free:
>>>                  if (!ubi->volumes[i])
>>>                          continue;
>>>                  kfree(ubi->volumes[i]->eba_tbl);
>>> +               ubi->volumes[i]->eba_tbl = NULL;
>>>          }
>>>          return err;
>>>   }
>> You are right. I've just pushed your patch to ubi-2.6.git/master.
>
> Great. Thanks for the quick response!
> Is there any merge cycle outstanding for ubifs in 2.6.31?

It is UBI, not UBIFS. I've created ubi-2.6.git/for-linus branch
with the stuff to merge for 2.6.31.

But I anyway always encouredge people to use the linux-next stuff
which has the latest UBI/UBIFS changes.

See http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
