Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM69r-0005Jf-Ak
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 11:26:20 -0500
Message-ID: <442179EB.9050605@intel.com>
Date: Wed, 22 Mar 2006 19:23:07 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>		<1142953764.13740.0.camel@sauron.oktetlabs.ru>	<442041BE.9070407@intel.com>		<1142967444.13740.9.camel@sauron.oktetlabs.ru>		<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>		<442111B5.6090308@yandex.ru>
	<442161C3.80604@intel.com>		<1143038877.29683.10.camel@sauron.oktetlabs.ru>	<442168D3.70302@intel.com>	<1143040557.29683.14.camel@sauron.oktetlabs.ru>
	<44216F99.9040304@intel.com> <44217124.20607@ru.mvista.com>
In-Reply-To: <44217124.20607@ru.mvista.com>
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

Vitaly Wool wrote:
> May I ask why at all you need to add a new mechanism for striping iso, 
> say, modifying mtdconcat? Thanks!
>
> Vitaly

Vitaly,

as I have already said concatenation is like JBOD in the world of hard 
drives. JBOD means "just a bunch of disks". Meanwhile striping is like 
RAID level 0. As you may know JBOD and RAID0 are completely different. 
Concatenation and striping have only one common thing - each of them 
makes larger devices. That's all. All the rest are different including 
new device parameters, writing, reading, erasing routines. Note, that 
concatenation layer writes/erases/etc from the caller thread, meanwhile 
striping layer do this from several separate threads, splitting 
operations by special algorithm.

Moreover the idea is different. Concatenation only purpose is to make 
larger device from several smaller devices. Striping purpose is to make 
devices operate faster.

Thanks,
Alexander Belyakov
