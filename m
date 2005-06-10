Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dgeox-0005Ub-H1
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 04:24:56 -0400
Message-ID: <42A94E36.8070009@yandex.ru>
Date: Fri, 10 Jun 2005 12:24:22 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <BAY2-F11432519227105B42F84CDDAFF0@phx.gbl>	
	<42A9496D.9020806@yandex.ru> <1118391261.11408.110.camel@server11>
In-Reply-To: <1118391261.11408.110.camel@server11>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tong changda <tongcd@hotmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Munira Ahmed wrote:
> I am also working on jffs2 and have been advised to update mtd. but I am
> afraid that keeping the kernel same and updating the mtd may result in
> some incomapatibility.

I don't know. I've never used 2.4 + MTD. With 2.6 there must be no 
problems. I know for sure that the last JFFS2 won't work on 2.4.19 and less.

Thus, just try it. Nonetheless, better move to 2.6.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
