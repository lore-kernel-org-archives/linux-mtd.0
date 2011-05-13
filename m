Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKzd6-00058r-Sk
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 21:10:37 +0000
Received: by fxm14 with SMTP id 14so2712343fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 14:10:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110513210922.GD29261@p183>
References: <20110513203419.GA29261@p183>
	<BANLkTinAx_wd2NtVPR5nw7K4Ga7_ij3M4A@mail.gmail.com>
	<20110513210922.GD29261@p183>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 13 May 2011 17:10:15 -0400
Message-ID: <BANLkTinjfMT=WenuY3URTR6+VHxqm0xTnQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert to seq_file interface
To: Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 13, 2011 at 17:09, Alexey Dobriyan wrote:
> On Fri, May 13, 2011 at 04:57:41PM -0400, Mike Frysinger wrote:
>> On Fri, May 13, 2011 at 16:34, Alexey Dobriyan wrote:
>> > ->read_proc interface is going away, switch to seq_file.
>>
>> while i like converting to seq_file in general, i'm not sure this
>> conversion is correct ... or maybe it's just incomplete ?
>>
>> > +static int mtd_proc_show(struct seq_file *m, void *v)
>> > =C2=A0{
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd;
>> >
>> > + =C2=A0 =C2=A0 =C2=A0 seq_puts(m, "dev: =C2=A0 =C2=A0size =C2=A0 eras=
esize =C2=A0name\n");
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&mtd_table_mutex);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd_for_each_device(mtd) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seq_printf(m, "mtd%=
d: %8.8llx %8.8x \"%s\"\n",
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mtd->index, (unsigned long long)mtd->size,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mtd->erasesize, mtd->name);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&mtd_table_mutex);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> > =C2=A0}
>>
>> this is the new version of the func. =C2=A0the old one handled
>> offsets/seeks while the new one doesnt seem to. =C2=A0am i mistaken ?
>>
>> in particular, it seems like this is missing the seq_operations set of
>> funcs for walking the list of mtd devices ...
>
> seq_operations are mostly needed when read(2) is going to be short
> enough to not require walking full object list to fill necessary amount.
> Seeing that bash reads 32 KB by default, we go for simpler code.

np.  thanks for the info.  i can probably convert some of my code to
simpler seq_file logic ;).

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
