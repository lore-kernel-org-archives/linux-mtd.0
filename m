Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg49f-00012v-Qh
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 02:56:40 +0000
Received: by mail-vc0-f177.google.com with SMTP id id10so1762252vcb.8
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 18:56:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <528196CF.9090404@freescale.com>
References: <1384189727-19563-1-git-send-email-festevam@gmail.com>
 <20131111182324.GE20061@ld-irv-0074.broadcom.com>
 <528196CF.9090404@freescale.com>
Date: Mon, 11 Nov 2013 18:56:18 -0800
Message-ID: <CAN8TOE9YhVKKXK6q4kZc0GBmmK_MO7gPSi+nkZFM07krO=3_zQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Fix NULL pointer dereference
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 11, 2013 at 6:47 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA11=D4=C212=C8=D5 02:23, Brian Norris =D0=B4=B5=C0:
>> (2) The second switched the whole NAND buffer over to a kzalloc'd
>>     buffer, with NAND_OWN_BUFFERS. I'm not a huge fan of
>>     NAND_OWN_BUFFERS, and I think drivers should only be using it if
>>     they really need it, for special buffer placement or some other good
>>     reason. You just happen to need a buffer "too early", where you can
>>     really just allocate a small temporary buffer.
> why I use the NAND_OWN_BUFFERS? just for a small temporary buffer?
> the answer is no.
>
> For imx23, the work flow is like this:
> [1] first check the fingerprint, if we can find it, we will return
> immediately.
> [2] if [1] failed, such as you erase all the partitions, the gpmi will ca=
ll
> mx23_write_transcription_stamp() to write the fingerprint.
>
> So the @chip->buffer is not only used by the
> mx23_check_transcription_stamp(),
> but _also_ used by the mx23_write_transcription_stamp() when the gpmi
> can not find any
> fingerprint in the NAND page.

Right, thanks for pointing this out.

> That's why i use the NAND_OWN_BUFFERS, the buffer can be used by both
> the mx23_check_transcription_stamp()
> and mx23_write_transcription_stamp().

I will resume discussion on your NAND_OWN_BUFFERS patch.

Brian
