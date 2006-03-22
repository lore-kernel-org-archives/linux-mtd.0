Received: from [80.250.169.156] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM4vR-0002XV-C0
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 10:07:26 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <442161C3.80604@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
	<442111B5.6090308@yandex.ru>  <442161C3.80604@intel.com>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 17:47:57 +0300
Message-Id: <1143038877.29683.10.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-03-22 at 17:40 +0300, Alexander Belyakov wrote:
> In MTD code I saw alignment checks looking like this:
> 
> if (instr->addr & (concat->mtd.erasesize - 1))
>     return -EINVAL;
> It will fail if erasesize is not power-of-two number.
So, we should prohibit 3-flash striping just to please this piece of
code?

> Anyway interleaving algorithm itself makes no assumptions about number 
> of subdevices. So code in the patch can be used to stripe 3, 5, etc 
> devices. Just remove or replace alignment checks from stripe_erase() 
> routine. It should work.
Ok, then don't write in documentation that it is possible to stripe only
2,4,8... flashes as this restriction is insane. Or write there, that if
you have a broken application, don't do 3-flash striping.

You support really exotic things like striping flashes with different
eraseblock size which I fear nobody will ever use, but you prohibit
3-chip striping which is much more useful.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
