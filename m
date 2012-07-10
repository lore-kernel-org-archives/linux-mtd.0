Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoQM7-0002DK-MR
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2012 02:39:17 +0000
Received: by yhjj52 with SMTP id j52so13268436yhj.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2012 19:39:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120626170902.7aba4a2b@pixies.home.jungo.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <20120626170902.7aba4a2b@pixies.home.jungo.com>
Date: Mon, 9 Jul 2012 19:39:12 -0700
Message-ID: <CAN8TOE-nZh_jJR1VfDa38WOV79t3ODRpXuuueWmEx4749cDTsg@mail.gmail.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 26, 2012 at 7:09 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Fri, 22 Jun 2012 16:35:45 -0700 Brian Norris <computersforpeace@gmail.=
com> wrote:
>> scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OO=
B
>> mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.
>
> Please consider rephrasing, text is bit confusing.

I realized I was missing the word "to". So the edit would read:

scan_read_raw_oob() is used in only in places where the
MTD_OPS_PLACE_OOB mode is preferable to MTD_OPS_RAW mode, so use
MTD_OPS_PLACE_OOB instead.

I can rephrase more, regarding what each mode does, but I'm wondering
if this clears up your understanding.

>> + * Scan read data from data+OOB. May traverse multiple pages, interleav=
ing
>> + * page,OOB,page,OOB,... in buf.
>
> In the case 'len' is less than 'mtd->writesize' (possible from a
> 'scan_block_full' call), the read oob will be placed immediately after
> the partially read page, quoting scan_read_raw_oob:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.len =3D min(len, (size_t)mtd->writesi=
ze);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.oobbuf =3D buf + ops.len;
>
> Any idea if this is intentional or a bug?

Not really. I honestly don't fully understand many of the options in
NAND_BBT, but I'm trying to work through some of it. I think there's a
lot of half-baked stuff in here with not-very-good code structure.
Some of the code is written as if it were generic, but it's only meant
for some very specific circumstances.

With that said, here's a thought: it looks like your hypothetical "len
< mtd->writesize" would only occur with NAND_BBT_SCANEMPTY disabled
and NAND_BBT_SCANALLPAGES enabled. But I only see them used together:
NAND_BBT_SCANEMPTY | NAND_BBT_SCANALLPAGES (omap2.c and with
agand_flashbased in nand_bbt.c). So maybe it's a kind of "bug" for a
case that was never really thought out. And if they must be used
together, maybe we should document that.

Brian
