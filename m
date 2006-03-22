Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM4zm-0002vq-3K
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 10:11:44 -0500
Message-ID: <442168D3.70302@intel.com>
Date: Wed, 22 Mar 2006 18:10:11 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>	
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>	
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>	
	<442111B5.6090308@yandex.ru> <442161C3.80604@intel.com>
	<1143038877.29683.10.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143038877.29683.10.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>,
	linux-mtd@lists.infradead.org
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
>> Anyway interleaving algorithm itself makes no assumptions about number 
>> of subdevices. So code in the patch can be used to stripe 3, 5, etc 
>> devices. Just remove or replace alignment checks from stripe_erase() 
>> routine. It should work.
>>     
> Ok, then don't write in documentation that it is possible to stripe only
> 2,4,8... flashes as this restriction is insane. Or write there, that if
> you have a broken application, don't do 3-flash striping.
>
> You support really exotic things like striping flashes with different
> eraseblock size which I fear nobody will ever use, but you prohibit
> 3-chip striping which is much more useful.
As I said you can stripe non-power-of-two number of devices. But in that 
case you should always remember that someone even inside MTD code can 
try to make alignment check or something else that will fail.

In original message I just point the safe usage case. Sorry for causing 
that misunderstanding.

Thanks,
Alexander Belyakov
