Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nHea-00041l-9Z
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 13:56:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "\"David" =?ISO-8859-1?Q?M=FCller?= "(ELSOFT AG)\"" <d.mueller@elsoft.ch>
In-Reply-To: <3F3B81FD.1010205@elsoft.ch>
References: <3F3B75AA.6050701@elsoft.ch>
	 <1060861648.3152.70.camel@passion.cambridge.redhat.com>
	 <3F3B7D66.5030907@elsoft.ch>
	 <1060863668.3152.72.camel@passion.cambridge.redhat.com>
	 <3F3B81FD.1010205@elsoft.ch>
Message-Id: <1060865777.3152.79.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 14 Aug 2003 13:56:17 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 internals question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-14 at 13:35, "David M=C3=BCller (ELSOFT AG)" wrote:
> Sorry, i was talking about block boundary, not page boundary. Or is it
> just a typo?

Oh, sorry. We'll not read over _logical_ eraseblock boundaries but on
large chips we may artificially increase the eraseblock size to be 2* or
4* the physical eraseblock size, to reduce the number of 'struct
jffs2_eraseblock' we have to allocate. In that case, yes, we'll be
reading across eraseblock boundaries.

--=20
dwmw2
