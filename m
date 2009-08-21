Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeJV0-0002CT-S5
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 02:05:07 +0000
Received: by rv-out-0506.google.com with SMTP id g37so187100rvb.7
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Aug 2009 19:05:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A8D2F10.1050902@nokia.com>
References: <ed62800908192059g57e85893ga352793e52c43a65@mail.gmail.com>
	<4A8D2F10.1050902@nokia.com>
Date: Fri, 21 Aug 2009 12:05:00 +1000
Message-ID: <ed62800908201905nc1bd812u7f3c0f67bc01ef23@mail.gmail.com>
Subject: Re: ubifs mount problem: UBIFS error (pid 1152): validate_sb: bad
	superblock, error 8
From: Aras Vaichas <arasv@magellan-technology.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	MTD-LIST <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2009 at 9:10 PM, Adrian Hunter<adrian.hunter@nokia.com> wro=
te:
> Aras Vaichas wrote:
>
>> /root # mount -t ubifs ubi1:spareubi /mnt
>> UBIFS error (pid 823): validate_sb: bad superblock, error 8
>> mount: mounting ubi1:spareubi on /mnt failed: Invalid argument
>
> The journal is too big for the partition - see below where it
> says:
>
> UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
>
> You will need to force the journal smaller using mkfs.ubifs -j
> option.

Yes, that works.

I see my problem now. From mkfs.ubifs.c:

        /* Make the journal about 12.5% of main area lebs */
        c->max_bud_bytes =3D (lebs / 8) * (long long)c->leb_size;
        /* Make the max journal size 8MiB */
        if (c->max_bud_bytes > 8 * 1024 * 1024)
            c->max_bud_bytes =3D 8 * 1024 * 1024;
        if (c->max_bud_bytes < 4 * c->leb_size)
            c->max_bud_bytes =3D 4 * c->leb_size;

The journal size is calculated based on the maximum FS size.

This means that the *minimum" ubifs size is a function of the
*maximum* UBIFS size.  Interesting.

I chose an 8MB partition because I'm doing a lot of testing for a
factory/production flashing system, so I don't want to wait long while
I go through lots of erase/write/attach/mount cycles. Since this is
unusual, I won't worry too much about it.

Would there be a benefit to set a small fixed journal size, regardless
of UBIFS maximum size, for embedded systems?

Aras
