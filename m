Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM3V8-0000tr-5A
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 08:35:56 -0500
Message-ID: <442152A5.9020300@intel.com>
Date: Wed, 22 Mar 2006 16:35:33 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>	
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>	 <44211E6E.7070406@yandex.ru>
	<4421263A.7010900@intel.com>
	<1143024670.13740.40.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143024670.13740.40.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Ok, this only confirms that you should compose a small and nice
> documentation file.
>   

What exactly do you wish to see in that small documentation file?

BTW I made such a file before sending patch to infradead mailing list - 
you can see it in the original message. After discussion here I can 
extend it with all questions and answers from this thread if needed.

> A question arises, does this make sense to stripe flashes with different
> erasesize at all? Flashes should be of particular size in order not to
> waste space. Any real need to make the striping layer more complex? 
>   
Making striped device from flashes with different erasesize does not 
make striping layer significantly more complex. Just some additional 
math to calculate least common multiple at the creation stage.

Thanks,
Alexander Belyakov
