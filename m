Received: from [80.250.169.156] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM54Y-0003CW-G8
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 10:16:40 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <442168D3.70302@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
	<442111B5.6090308@yandex.ru>  <442161C3.80604@intel.com>
	<1143038877.29683.10.camel@sauron.oktetlabs.ru>
	<442168D3.70302@intel.com>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 18:15:57 +0300
Message-Id: <1143040557.29683.14.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
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

On Wed, 2006-03-22 at 18:10 +0300, Alexander Belyakov wrote:
> As I said you can stripe non-power-of-two number of devices. But in that 
> case you should always remember that someone even inside MTD code can 
> try to make alignment check or something else that will fail.
> 
> In original message I just point the safe usage case. Sorry for causing 
> that misunderstanding.
I think you should remove this limitation before submitting your patch
to open source, unless you have strong arguments not to do this. It
looks like you don't have them.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
