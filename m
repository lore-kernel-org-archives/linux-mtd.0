Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM0VH-0005ha-81
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 05:23:54 -0500
Message-ID: <44212592.6080609@yandex.ru>
Date: Wed, 22 Mar 2006 13:23:14 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142968084.13740.19.camel@sauron.oktetlabs.ru>
	<44211F79.1010503@intel.com>
In-Reply-To: <44211F79.1010503@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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



Alexander Belyakov wrote:
> Yes, in current implementation both blocks on subdevices, representing 
> one superblock, will be marked as bad.
BTW, using term "superblock" is not very nice IMO.

I'd offer to call it just "block" or "eraseblock", and to call 
eraseblocks of the subbevices as "sub-blocks or "sub-eraseblocks".

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
