From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@oktetlabs.ru
In-Reply-To: <41921D97.7040300@oktetlabs.ru>
References: <41921D97.7040300@oktetlabs.ru>
Content-Type: text/plain
Message-Id: <1100171797.8191.1362.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Nov 2004 11:16:37 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & the write buffer patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-11-10 at 16:54 +0300, Artem Bityuckiy wrote:
> Dear JFFS2 maintainers,
> 
> I was recently fixed the problem with the JFFS2 write buffer races and 
> have posted it to the MTD list. Unfortunately, maintainers did not 
> comment the patch (only Estelle Hammache kindly responded).

Sorry, I've been busy. Like you, I really don't like the extra locking.
I was trying to find time to stare really hard at it and find a way of
doing it without extra locks. 

> Could any one who has the cvs access rights please commit this patch? If 
> the patch is bad, we may discuss how we can change it.
> 
> The another possibility is to grant me the CVS access rights and I will 
> commit the patch myself.

Mail me a SSH public key and you can have an account to commit it
yourself. But please let's convince ourself the new lock _really_ is
necessary before we do that. I really don't like it.

-- 
dwmw2
