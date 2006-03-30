Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOw3p-0001ey-H5
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 07:15:45 -0500
Message-ID: <442BCBE3.70206@ru.mvista.com>
Date: Thu, 30 Mar 2006 16:15:31 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	
	<442B9FA5.9070901@ru.mvista.com>
	<1143719455.3579.41.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143719455.3579.41.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
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
>> Still it's unclear why not to provide a configurable extension to 
>> mtdconcat rather than create a new layer.
>>     
>
> Well, it is actually quite clear. Yes, in a way this may be considered
> as a concatenation, but this is not the purpose of the striping layer.
> If you want to concatenate, you don't need all its complexities.
>
> I think that concatenation has to stay concatenation - simple and
> straight-forward. It has to do its small task and do it well.  No need
> to jam tons of the striping code to the tiny'n'shiny concatenation
> module.
>
>   
Yep, probably you both are right.

Vitaly
