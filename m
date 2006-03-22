Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM5Ra-0003hf-Qp
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 10:40:26 -0500
Message-ID: <44216F99.9040304@intel.com>
Date: Wed, 22 Mar 2006 18:39:05 +0300
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
	<442168D3.70302@intel.com>
	<1143040557.29683.14.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143040557.29683.14.camel@sauron.oktetlabs.ru>
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
> I think you should remove this limitation before submitting your patch
> to open source, unless you have strong arguments not to do this. It
> looks like you don't have them.
Artem,
it is RFC. I have no doubts that other misunderstandings and reasonable 
requests for code change will arise. At the moment I see two: 1 - remove 
some artificial limitations for number of devices to be striped, and 2 - 
insmod parameters change from device name to device number. I'll fix 
them along with other things before posting patch next time.

Thanks,
Alexander Belyakov
