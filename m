Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nGZz-0003Lv-Hk
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 12:47:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "\"David" =?ISO-8859-1?Q?M=FCller?= "(ELSOFT AG)\"" <d.mueller@elsoft.ch>
In-Reply-To: <3F3B75AA.6050701@elsoft.ch>
References: <3F3B75AA.6050701@elsoft.ch>
Message-Id: <1060861648.3152.70.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 14 Aug 2003 12:47:29 +0100
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

On Thu, 2003-08-14 at 12:42, "David M=C3=BCller (ELSOFT AG)" wrote:
> Is it true that the read calls emitted from the JFFS2 code to the MTD HW
> driver do not cross NAND block boundries (nand_read_ecc() has its start
> and end point of reading in the same NAND block)?

I'd first like to know why you think you need the answer to this... :)

--=20
dwmw2
