Subject: Re: [PATCH] MTD: mphysmap driver resurrection
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0606140613k7ea7918fl48ead339530c4cb6@mail.gmail.com>
References: <fe810cf0606140613k7ea7918fl48ead339530c4cb6@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 14 Jun 2006 14:33:53 +0100
Message-Id: <1150292033.3176.127.camel@pmac.infradead.org>
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

On Wed, 2006-06-14 at 17:13 +0400, Alexander Belyakov wrote:
> The patch just contains mphysmap driver code from one of the latest
> CVS snapshots.

Nak. We ought to be able to use the existing physmap driver for this,
and just register multiple platform_devices for it.

And this file isn't valid UTF-8, either.

-- 
dwmw2
