Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLzBJ-0003Pf-W0
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 03:59:09 -0500
Message-ID: <442111B5.6090308@yandex.ru>
Date: Wed, 22 Mar 2006 11:58:29 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603211434261.3631@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>
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
>>Why? I don't see any thing bad with having 3*128KiB eraseblock size...
> I agree with you ....... as long as someone is willing to audit all MTD 
> client code to certify that no assumption about erase block sizes being 
> a power of 2 is present.

Well, there is no much client code. JFFS2 is happy with this size. If 
some client is not happy, this is its problems. This client just has to 
be fixed or not use striping with non-power-of-two devices. Indeed, 
striping is a distinct layer and is not compulsory to use.

I don't see any reason in prohibiting striping 3 devices, or 5 devices. 
Just because power of 2 is digits are widely used is not a serious argument.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
