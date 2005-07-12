Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DsK29-0004zj-Ut
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2005 08:38:52 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1121170500.27264.149.camel@hades.cambridge.redhat.com>
References: <1121166766.16978.71.camel@sauron.oktetlabs.ru>
	<1121170500.27264.149.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Tue, 12 Jul 2005 16:38:13 +0400
Message-Id: <1121171893.16978.77.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] (preliminary) new fragtree build method
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-07-12 at 13:15 +0100, David Woodhouse wrote:
> Looks like it breaks the eCos build.
> 
There was some mess with '#ifdef' directives, fixed.
New patch:
http://www.infradead.org/~dedekind/reverse-version-prelim-02.diff
