Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEk2D-0000NL-GA
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 03:19:14 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1111701659.6588.4.camel@localhost.localdomain>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com> <loom.20050323T212715-407@post.gmane.org>
	<4242925F.D29BC7CE@st.com>  <42429C1C.8050600@yandex.ru>
	<1111701659.6588.4.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 25 Mar 2005 11:18:40 +0300
Message-Id: <1111738720.1978.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-24 at 22:00 +0000, David Woodhouse wrote:
> On Thu, 2005-03-24 at 13:53 +0300, Artem B. Bityuckiy wrote:
> > then you have the guarantee that you either have written all or 
> > nowthing. JFFS2 does guarantee that due to its implementation.
> 
> JFFS2 might happen to _do_ that due to its implementation, but it's not
> a guarantee. POSIX doesn't require that writes are atomic w.r.t power
> failure.

Absolutely. I've noted that this is just happens to be owing to JFFS2's
implementation. Nothing else.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
