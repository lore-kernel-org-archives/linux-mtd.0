Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKfGW-00075P-7C
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 06:25:26 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] mtd: Fallback to ->_read/write_oob() when ->_read/write()
 is missing
References: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
 <87poe9vi4b.fsf@belgarion.home> <20170612084558.43fb1e21@bbrezillon>
Date: Tue, 13 Jun 2017 08:24:56 +0200
In-Reply-To: <20170612084558.43fb1e21@bbrezillon> (Boris Brezillon's message
 of "Mon, 12 Jun 2017 08:45:58 +0200")
Message-ID: <87lgowv1zb.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> According to the C99 standard (section 6.7.8.21):
>
> "
> If there are fewer initializers in a brace-enclosed list than there are
> elements or members of an aggregate, or fewer characters in a string
> literal used to initialize an array of known size than there are
> elements in the array, the remainder of the aggregate shall be
> initialized implicitly the same as objects that have static storage
> duration.
> "
>
> which should guarantee that uninitialized fields are actually set to 0,
> even when the struct is allocated on the stack.
Ah yes, indeed, my bad.

Therefore for docg3.c :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
