Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ot9JN-0005YA-0z
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 01:18:53 +0000
Received: by iwn40 with SMTP id 40so6839341iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 18:18:51 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Sep 2010 09:18:51 +0800
Message-ID: <AANLkTi=vYL2uAycRoaBW3cG5EHb_FU3sYcP=899ouHuK@mail.gmail.com>
Subject: Anyone can help me about do_write_buffer at cfi_cmdset_0002
From: Qi Zhang <qzhan2009@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello:

=A0=A0=A0 In functions
=A0=A0=A0 do_write_buffer @ drivers/mtd/chips/cfi_cmdset_0002.c.
=A0=A0=A0 ...
=A0=A0=A0 map_write(map, CMD(0x29), cmd_adr);
=A0=A0=A0 /* send buffer program command */
=A0=A0=A0 chip->state =3D FL_WRITING;
=A0=A0=A0 /* change chip state */
=A0=A0=A0 INVALIDATE_CACHE_UDELAY(map, chip, adr, map_bankwidth(map),
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 chip->word_write_time);
=A0=A0=A0 /* why word_write_time? */
=A0=A0=A0 ...

=A0=A0=A0 Struct flchip already have "buffer_write_time",
=A0=A0=A0 seems it should replace the "word_write_time".
=A0=A0=A0 Both of thems come from the cfi_ident's
=A0=A0=A0 "WordWriteTimeoutTyp" and "BufWriteTimeoutTyp",
=A0=A0=A0 which indicate the real flash performance on word program
=A0=A0=A0 and buffer program and usually they are quite different.

=A0=A0=A0 Further more, the cfi_ident also have
=A0=A0=A0 "WordWriteTimeoutMax", "BufWriteTimeoutMax",
=A0=A0=A0 but the real implementation igore them as below

=A0=A0=A0 ......
=A0=A0=A0 unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
=A0=A0=A0 ....
=A0=A0=A0 INVALIDATE_CACHE_UDELAY(map, chip, adr, map_bankwidth(map),
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 chip->word_write_time);
=A0=A0=A0 timeo =3D jiffies + uWriteTimeout;
=A0=A0=A0 for (;;) {
=A0=A0=A0=A0=A0=A0 ......
=A0=A0=A0=A0=A0=A0 if (time_after(jiffies, timeo) && !chip_ready(map, adr))
=A0=A0=A0=A0=A0=A0 break;
=A0=A0=A0=A0=A0=A0 ......
=A0=A0 }

=A0=A0 The max time out will be "word_write_time" + "uWriteTimeOut"

=A0=A0 Let's look at Intel M29EW flash's CFI spec.

=A0=A0 WordWriteTimeoutTyp : 512us
=A0=A0 BufWriteTimeoutTyp=A0=A0=A0 : 1024us
=A0=A0 WordWriteTimeoutMax: 1024us
=A0=A0 BufWriteTimeoutMax:=A0=A0=A0 4096us

=A0=A0 for HZ =3D 100, that will be ok since 1 tick 10ms
=A0=A0 But for HZ =3D 1000, we got only 2.5ms ( 512us + 2 ticks),
=A0=A0 and 3ms (1024us + 2 ticks)
=A0 (when replaced word_write_time with buf_write_time).
=A0=A0 Both are not met 4096us spec.

=A0=A0 Does anybody can help on that?

Thanks
Zhang Qi
