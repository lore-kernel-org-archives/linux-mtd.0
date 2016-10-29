Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0Zn8-0004wH-F0
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 19:59:47 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, kernel@pengutronix.de
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: write exactly one message on
 probe failure
References: <1474276878-1021-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20161028100419.1ba04968@bbrezillon>
 <ac811aeb-1f9d-e985-134b-8faba0a1a4cf@gmail.com>
Date: Sat, 29 Oct 2016 21:59:18 +0200
In-Reply-To: <ac811aeb-1f9d-e985-134b-8faba0a1a4cf@gmail.com> (Marek Vasut's
 message of "Sat, 29 Oct 2016 19:56:39 +0200")
Message-ID: <87funf0vvt.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marek Vasut <marek.vasut@gmail.com> writes:

> On 10/28/2016 10:04 AM, Boris Brezillon wrote:
>> On Mon, 19 Sep 2016 11:21:18 +0200
>> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:
>>=20
>>> For some error paths alloc_nand_resource() emitted an error message, for
>>> others it didn't. Make it consistently print a message including the
>>> error code where it's not constant and drop the hardly helpful
>>> additional message printed by the caller of alloc_nand_resource.
>>>
>>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>>=20
>> It looks good to me. Ezequiel, Robert, any objection to this patch? If
>> not, can I have your Acked/Reviewed-by ?
Hi,

Actually I was wondering if my mail system is utterly broken ... This is the
first mail I receive, while it seems to me I was in the recipients in the f=
ormer
ones ...

You can take my Reviewed-by, at least from:
	https://patchwork.ozlabs.org/patch/671644/

As a side note, normally for pxa architecture we use a printk format to dis=
play
the return value as :
   pr_something("XXXX :%d\n", ret)

As pxa3xx_nand is shared with other architectures this will be Boris/Ezequi=
el's
call.

Cheers.

--
Robert
