Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DXvI-0000B6-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 21:53:00 +0100
Received: from 213.237.12.194.adsl.brh.worldonline.dk ([213.237.12.194] helo=firewall.jaquet.dk)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15DY0d-0006U4-00
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2001 21:58:31 +0100
Date: Fri, 22 Jun 2001 22:57:59 +0200
From: Rasmus Andersen <rasmus@jaquet.dk>
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>,
	dwmw2@redhat.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cleanup in drivers/mtd/ftl.c (245-ac16)
Message-ID: <20010622225759.F842@jaquet.dk>
References: <20010622222931.C842@jaquet.dk> <20010622172106.B3614@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010622172106.B3614@conectiva.com.br>; from acme@conectiva.com.br on Fri, Jun 22, 2001 at 05:21:06PM -0300
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, Jun 22, 2001 at 05:21:06PM -0300, Arnaldo Carvalho de Melo wrote:
> Hi Rasmus,
> 
> 	I've fixed this ones and its already in 2.4.6-pre5, please take a
> look and see if something is missing.

These patches are very close so I'll of course retract mine[1].
The only thing I'll recommend is the printk I have in the error
path.

[1] Sorry about the unnecessary mailing. I am not accustomed to
janitor-like patches being in Linus' kernel before Alan's :)
(Arnaldo already offered an explanation for why this one happened
to be.)
-- 
Regards,
        Rasmus(rasmus@jaquet.dk)

Smoking kills. If you're killed, you've lost a very important part of your
life.  -Brooke Shields, during an interview to become spokesperson for a
federal anti-smoking campaign.
