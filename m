Subject: Re: [PATCH] MTD: mphysmap driver resurrection
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0606140648w47571167x364d815181d18453@mail.gmail.com>
References: <fe810cf0606140613k7ea7918fl48ead339530c4cb6@mail.gmail.com>
	<1150292033.3176.127.camel@pmac.infradead.org>
	<fe810cf0606140648w47571167x364d815181d18453@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 14 Jun 2006 14:55:49 +0100
Message-Id: <1150293349.3176.136.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-14 at 17:48 +0400, Alexander Belyakov wrote:
> Ok. Just posted it in case of unintentional (as Josh mentioned) driver
> exclusion.
> 
> btw, is it possible to find somewhere a kind of list of
> features/drivers/patches which were removed/reverted during migration
> to GIT? 

Unfortunately not. I did a quick pass through the CVS tree, pulling in
the bits which obviously made sense. In general, that didn't include new
map drivers, since I actually want to kill as many map drivers as
possible in favour of platform_device stuff.

-- 
dwmw2
