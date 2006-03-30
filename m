Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FOvgV-00015Y-Ph
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 06:51:35 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <442B9FA5.9070901@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com>
Content-Type: text/plain
Date: Thu, 30 Mar 2006 15:50:55 +0400
Message-Id: <1143719455.3579.41.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-03-30 at 13:06 +0400, Vitaly Wool wrote:
> Hi Alexander,
> 
> Belyakov, Alexander wrote:
> > One may say that striping is quite similar to already existing in MTD
> > concatenation layer. That is not true since these layers have some sharp
> > distinctions. The first one is the purpose. Concatenation only purpose
> > is to make larger device from several smaller devices. Striping purpose
> > is to make devices operate faster. Next difference is provided access to
> > sub-devices. Concatenation layer provides linear access to sub-devices.
> > Striping provides interleaved access to sub-devices.
> >   
> Still it's unclear why not to provide a configurable extension to 
> mtdconcat rather than create a new layer.

Well, it is actually quite clear. Yes, in a way this may be considered
as a concatenation, but this is not the purpose of the striping layer.
If you want to concatenate, you don't need all its complexities.

I think that concatenation has to stay concatenation - simple and
straight-forward. It has to do its small task and do it well.  No need
to jam tons of the striping code to the tiny'n'shiny concatenation
module.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
