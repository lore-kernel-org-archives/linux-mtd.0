Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM4VL-0001u1-TN
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 09:40:16 -0500
Message-ID: <442161C3.80604@intel.com>
Date: Wed, 22 Mar 2006 17:40:03 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
	<442111B5.6090308@yandex.ru>
In-Reply-To: <442111B5.6090308@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
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
> Nicolas Pitre wrote:
>>> Why? I don't see any thing bad with having 3*128KiB eraseblock size...
>> I agree with you ....... as long as someone is willing to audit all 
>> MTD client code to certify that no assumption about erase block sizes 
>> being a power of 2 is present.
>
> Well, there is no much client code. JFFS2 is happy with this size. If 
> some client is not happy, this is its problems. This client just has 
> to be fixed or not use striping with non-power-of-two devices. Indeed, 
> striping is a distinct layer and is not compulsory to use.
>
> I don't see any reason in prohibiting striping 3 devices, or 5 
> devices. Just because power of 2 is digits are widely used is not a 
> serious argument.
>
In MTD code I saw alignment checks looking like this:

if (instr->addr & (concat->mtd.erasesize - 1))
    return -EINVAL;

It will fail if erasesize is not power-of-two number.

Anyway interleaving algorithm itself makes no assumptions about number 
of subdevices. So code in the patch can be used to stripe 3, 5, etc 
devices. Just remove or replace alignment checks from stripe_erase() 
routine. It should work.

Thanks,
Alexander Belyakov
