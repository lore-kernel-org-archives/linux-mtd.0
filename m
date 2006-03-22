Received: from [80.250.169.156] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM68B-00054N-0U
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 11:24:27 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <1143044379.29683.28.camel@sauron.oktetlabs.ru>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>
	<44211E6E.7070406@yandex.ru> <4421263A.7010900@intel.com>
	<1143024670.13740.40.camel@sauron.oktetlabs.ru>
	<442152A5.9020300@intel.com>
	<1143044379.29683.28.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 19:23:46 +0300
Message-Id: <1143044626.29683.31.camel@sauron.oktetlabs.ru>
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

On Wed, 2006-03-22 at 19:19 +0300, Artem B. Bityutskiy wrote:
> 1. Say that striped device is still a MTD device from the POW of users.
> Users use usual mtd->* operations when work with them.
> 
> 2. Say that the resulting eraseblock size is LCM * device number. Say
> that when one erases an eraseblock of the striped device, several
> physical eraseblocks of sub-devices are erased.
> 
3. And of course say about striping flashes with different erasesize and
about bad block handling.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
