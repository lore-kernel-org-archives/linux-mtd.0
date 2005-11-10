Received: from zproxy.gmail.com ([64.233.162.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ea1Qv-0006Tk-Rc
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 20:41:03 -0500
Received: by zproxy.gmail.com with SMTP id i11so392677nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Nov 2005 17:40:56 -0800 (PST)
Message-ID: <625fc13d0511091740m1563152fw68bbf484a898f90@mail.gmail.com>
Date: Wed, 9 Nov 2005 19:40:56 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20051110012407.66500.qmail@web51013.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20051110012407.66500.qmail@web51013.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/9/05, Vahid Fereydunkolahi <fereydunk@yahoo.com> wrote:
> Hi,
>  If on the JFFS2 Erase block 0 (jeb0) I wrote pages
> p0, p1, p2, and p3, and then I updated these pages on
> jeb1 with p0', p1', p2'  and on the jeb2 with p3',
> what would happen if the jeb1 goes bad (When I read
> the data back, is it goint to be p0, p1, p2, p3')?

Can you define what "goes bad" means?  If you're using NAND flash and
you get an ECC error, it can be a soft error and doesn't necessarily
mean the block itself is bad.  See the "How does JFFS2 handle a block
going bad in NAND flash" topic here:

http://linux-mtd.infradead.org/faq/jffs2.html

If you mean something else it depends which nodes are effected.  Each
node (p0', p1', p2'), has it's own CRC.  If any/all of those are bad,
you'll see an error message displayed and the previous node will be
used.

Hope that helps.

josh
