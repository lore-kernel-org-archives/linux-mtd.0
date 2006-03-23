Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMR4m-0008LM-UP
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 09:46:22 -0500
Message-ID: <4422B4A1.4010702@intel.com>
Date: Thu, 23 Mar 2006 17:45:53 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1143047296.29683.44.camel@sauron.oktetlabs.ru>
	<44226CEB.70200@intel.com>
	<Pine.LNX.4.64.0603230920030.3631@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603230920030.3631@localhost.localdomain>
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

Nicolas Pitre wrote:
> You should split your patch into pieces: mtdstrip core in one patch, and 
> driver modifications in their own separate patch for each of them.  But 
> please post the whole serie.
>
>
> Nicolas

Sounds reasonable.

I'll split my patch in three parts, make some changes in striping core 
we have already spoken about, and then post again starting three 
separate threads cross referencing to each other.

Thank you,
Alexander Belyakov
