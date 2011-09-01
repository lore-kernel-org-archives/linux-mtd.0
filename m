Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qz3rS-0007Bq-QZ
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2011 09:47:03 +0000
Received: by wwf10 with SMTP id 10so1178047wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Sep 2011 02:47:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjNe_d0-vz==Hjqzyu6taJHyHiPff8EH+=qadrOv_87LO8F2g@mail.gmail.com>
References: <20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
	<CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
	<20110831074902.GA26382@logfs.org>
	<CAMjNe_csYHWCRFXt6sW1FpMaS_RFGLM6z1ML6_-3xb-5x7DZtg@mail.gmail.com>
	<20110831141731.GA29862@logfs.org>
	<CAMjNe_d0-vz==Hjqzyu6taJHyHiPff8EH+=qadrOv_87LO8F2g@mail.gmail.com>
Date: Thu, 1 Sep 2011 15:16:59 +0530
Message-ID: <CAMjNe_eH+5Mi2p5BwRvD8Zg=Jr5j8=u6QbShH=FMcCNYQy9rkw@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> =A0" On Mon, Aug 29, 2011 at 3:37 PM, srimugunthan dhandapani
> <srimugunthan.dhandapani@gmail.com> wrote:
>
>> To clarify on the bugs I reported
>> 1. bonnie test( bonnie =A0-s 20 -r 10) does not complete . It gets stuck
>> at "Creating =A0files in sequential order ..."
>> (tested with nandsim, kernel 3.0.1. and 2.6.38.8; consistently
>> reproducible on 2 machines.)
>> The free command show that, while the bonnie test was run for half an
>> hour, free space changed from 2982340 KB to 2550156 KB.

In as far a i can infer, this bug happens because it is stuck in the
infinite loop at logfs_write_anchor() in journal.c


again:
	super->s_no_je =3D 0;
	for_each_area(i) {
		if (!super->s_area[i]->a_is_open)
			continue;
		super->s_sum_index =3D i;
		err =3D logfs_write_je(sb, logfs_write_area);
		if (err)
			goto again;
	}
	err =3D logfs_write_obj_aliases(sb);
	if (err)
		goto again;
	=09
It is stuck in the goto again loop.

thanks
