Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM78R-0007OZ-6t
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 12:28:55 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0603221159300.3631@localhost.localdomain>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>
	<44211E6E.7070406@yandex.ru> <4421263A.7010900@intel.com>
	<1143024670.13740.40.camel@sauron.oktetlabs.ru>
	<442152A5.9020300@intel.com>
	<1143044379.29683.28.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603221159300.3631@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 20:28:07 +0300
Message-Id: <1143048487.29683.54.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
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

Nicolas,

On Wed, 2006-03-22 at 12:17 -0500, Nicolas Pitre wrote:
> Please stop being so difficult with Alexander.
Am I? Did I ask something bad, pointers please?  I just want to realize
what does it do and to review it, nothing bad in this. Moreover, this is
good that somebody do this, right?

> The explanations provided so far might not be stellar English, but I 
> consider them still quite understandable. A disk stripe is a common 
> concept in computer science so simply saying that the same technique can 
> be applied to flash storage should be enough for you to grasp the whole 
> idea.  If you are not familiar with the concept it is not Alexander's 
> fault and I don't think he should lecture you on the topic.
Fine, I wrote I didn't realize this and that I should study RAID first,
right? What's wrong here?

> And regarding my opinion about a MTD stripe layer, well I think this is 
> a damn good idea and I wish I had thought about it before myself. It is 
> indeed a concept entirely separate from the MTD concat layer.  And it 
> doesn't obsolete the concat layer in any ways either.  Both have serious 
> advantages and inconvenients to consider before selecting either of 
> those.
Did I say they are similar? I did not say anything about concatenation.
Pointers please.

Are you sure I'm the right person you put to the "To:" field?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
