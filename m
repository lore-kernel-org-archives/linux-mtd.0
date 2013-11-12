Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg3yB-0000nn-8l
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 02:44:48 +0000
Message-ID: <528196CF.9090404@freescale.com>
Date: Tue, 12 Nov 2013 10:47:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Fix NULL pointer dereference
References: <1384189727-19563-1-git-send-email-festevam@gmail.com>
 <20131111182324.GE20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131111182324.GE20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C212=C8=D5 02:23, Brian Norris =D0=B4=B5=C0:
> (2) The second switched the whole NAND buffer over to a kzalloc'd
>     buffer, with NAND_OWN_BUFFERS. I'm not a huge fan of
>     NAND_OWN_BUFFERS, and I think drivers should only be using it if
>     they really need it, for special buffer placement or some other goo=
d
>     reason. You just happen to need a buffer "too early", where you can
>     really just allocate a small temporary buffer.
why I use the NAND_OWN_BUFFERS? just for a small temporary buffer?
the answer is no.

For imx23, the work flow is like this:
[1] first check the fingerprint, if we can find it, we will return
immediately.
[2] if [1] failed, such as you erase all the partitions, the gpmi will ca=
ll
mx23_write_transcription_stamp() to write the fingerprint.

So the @chip->buffer is not only used by the
mx23_check_transcription_stamp(),
but _also_ used by the mx23_write_transcription_stamp() when the gpmi
can not find any
fingerprint in the NAND page.


That's why i use the NAND_OWN_BUFFERS, the buffer can be used by both
the mx23_check_transcription_stamp()
and mx23_write_transcription_stamp().

thanks
Huang Shijie
