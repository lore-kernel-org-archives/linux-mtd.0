Received: from [80.250.169.156] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM4vR-0002XW-Cf
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 10:07:25 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <442152A5.9020300@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>
	<44211E6E.7070406@yandex.ru> <4421263A.7010900@intel.com>
	<1143024670.13740.40.camel@sauron.oktetlabs.ru>
	<442152A5.9020300@intel.com>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 17:40:19 +0300
Message-Id: <1143038419.29683.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
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

On Wed, 2006-03-22 at 16:35 +0300, Alexander Belyakov wrote:
> What exactly do you wish to see in that small documentation file?
Just good and structured explanation.

> BTW I made such a file before sending patch to infradead mailing list - 
> you can see it in the original message. After discussion here I can 
> extend it with all questions and answers from this thread if needed.
I personally found this mail vague, sorry.

> Making striped device from flashes with different erasesize does not 
> make striping layer significantly more complex. Just some additional 
> math to calculate least common multiple at the creation stage.
Will see. I'll look at the code later.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
