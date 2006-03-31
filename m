Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPEpP-0008RR-Di
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:18:34 -0500
Message-ID: <442CE5AB.8030903@intel.com>
Date: Fri, 31 Mar 2006 12:17:47 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
In-Reply-To: <442CE2DC.7020505@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Artem B. Bityutskiy wrote:
>> Good question. I think you could report this is a striped device 
>> (introducing an MTD_STRIPED option). Also you may provide a 
>> stripe_get_info(struct mtd_info *mtd) function which will return a 
>> struct stripe_info object describing this striped device, including 
>> the components it consists of.
> Err, and I believe you *have to* report mtd type as MTD_STRIPED.
>

In that case clients should be aware of using striped devices and 
provide special support for them. The one of the ideas of the suggested 
solution is to hide striping internals from the client providing generic 
mtd device (just with somewhat increased performance).

Alexander Belyakov
