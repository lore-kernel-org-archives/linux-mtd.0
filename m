Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFVys-0003yS-A8
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 08:03:23 -0400
Date: Wed, 14 Sep 2005 14:03:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Marius Groeger <mgroeger@sysgo.com>
Message-ID: <20050914120309.GB25468@wohnheim.fh-wedel.de>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
	<20050913230631.GB29579@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
	<20050914092634.GB22847@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509141136040.12001@mag.sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.63.0509141136040.12001@mag.sysgo.com>
Cc: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 September 2005 12:04:48 +0200, Marius Groeger wrote:
> 
> I know I'm quite religous here, and my point isn't really who's using
> something else than GCC today -- I grant you that this is quite unlikely.
> Experience shows however that you never know in what context you will have
> to reuse a specific piece of software, so if your write it portable in the
> first place, you're always safe.

My experience is that you cannot anticipate the problem coming up in
the future.  Next hardware revision will have unbelievable bugs, next
OS/compiler/etc. you port to just the same.

"if your write it portable in the first place" sounds nice, but noone
really knows what that means, before the acid test happens.


Back to the original topic, we really need to do something about the
warnings.  Most of them can be solved by using void* for the "just a
hunk of memory" type fields.

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
