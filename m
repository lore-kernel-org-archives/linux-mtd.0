Subject: Re: [PATCH 5/5] jffs2: Allow selection of compression mode via a
	sysfs attribute
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1172690034.16062.144.camel@localhost.localdomain>
References: <1172690034.16062.144.camel@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 25 Apr 2007 13:31:20 +0100
Message-Id: <1177504280.2755.212.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-crypto@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-28 at 19:13 +0000, Richard Purdie wrote:
> Allow selection of the compression mode for jffs2 via a sysfs 
> attribute. This establishes a sysfs presence for jffs2 through
> which other compression options could easily be exported too. 

And other options like GC threshold and other allocation things. So
perhaps put the sysfs subsystem_register() and other core bits into a
generic (and Linux-specific) file?

-- 
dwmw2
