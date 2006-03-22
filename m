Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM5XK-0003z8-9T
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 10:46:30 -0500
Message-ID: <44217124.20607@ru.mvista.com>
Date: Wed, 22 Mar 2006 18:45:40 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>		<1142953764.13740.0.camel@sauron.oktetlabs.ru>	<442041BE.9070407@intel.com>		<1142967444.13740.9.camel@sauron.oktetlabs.ru>		<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>		<442111B5.6090308@yandex.ru>
	<442161C3.80604@intel.com>		<1143038877.29683.10.camel@sauron.oktetlabs.ru>	<442168D3.70302@intel.com>	<1143040557.29683.14.camel@sauron.oktetlabs.ru>
	<44216F99.9040304@intel.com>
In-Reply-To: <44216F99.9040304@intel.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
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

Alexander,

Alexander Belyakov wrote:

> it is RFC. I have no doubts that other misunderstandings and 
> reasonable requests for code change will arise. At the moment I see 
> two: 1 - remove some artificial limitations for number of devices to 
> be striped, and 2 - insmod parameters change from device name to 
> device number. I'll fix them along with other things before posting 
> patch next time.

May I ask why at all you need to add a new mechanism for striping iso, 
say, modifying mtdconcat? Thanks!

Vitaly
