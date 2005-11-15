Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ec1GN-000553-23
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 08:54:31 -0500
Received: by zproxy.gmail.com with SMTP id i11so1598042nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Nov 2005 05:54:18 -0800 (PST)
Message-ID: <625fc13d0511150554v3ecfef0ekc9f481630e187eca@mail.gmail.com>
Date: Tue, 15 Nov 2005 07:54:18 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Keijiro Yano <keijiro_yano@yahoo.co.jp>
In-Reply-To: <004d01c5e9ea$f9fccac0$0b01a8c0@YANO>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <000c01c5e6d6$abf22490$0b01a8c0@YANO> <4375EA0D.2060704@yandex.ru>
	<002001c5e91a$a7c87180$0b01a8c0@YANO>
	<1131980118.3479.34.camel@sauron.oktetlabs.ru>
	<004d01c5e9ea$f9fccac0$0b01a8c0@YANO>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 mutex problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/05, Keijiro Yano <keijiro_yano@yahoo.co.jp> wrote:
> > Is this against the latest CVS?
>
> It is for Linux 2.6.10.
> But, based on my source level investigation, it can
> be applied for the latest CVS.

Somehow I doubt that.  There was recently a large whitespace cleanup
in the latest CVS.  I'm sure a patch that doesn't take that into
account will either throw lots of rejects or introduce whitespace
stuff that was just cleaned up.

Remember, you should diff against the latest.  You can't see the
whitespace stuff unless you have some option in your editor turned on.

josh
