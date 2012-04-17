Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK84e-00050C-5A
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 13:04:00 +0000
Received: by pbcun4 with SMTP id un4so8266262pbc.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 06:03:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334336350.13160.16.camel@sauron.fi.intel.com>
References: <CAHvCehVNgTgL+vY8SV1APN_xokogCM=Q+c7U1X9-_H1jn47Dpg@mail.gmail.com>
 <1334336350.13160.16.camel@sauron.fi.intel.com>
Date: Tue, 17 Apr 2012 21:03:57 +0800
Message-ID: <CAHvCehW+wXWC6MmPsjsZ6mr3i9CPR48anjSr-5rq8T7A8HEVhA@mail.gmail.com>
Subject: Re: UBIFS recovery fail after power-cut
From: b w <wdjjwb@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, 2012-04-04 at 20:09 +0800, b w wrote:
>
>> Then in ubifs_recover_leb,when call no_more_nodes this function return
>> 0 (which i think
>> should be return 1).At last recovery failed,so mount failed too.
>
> We have this code in that function:
>
> =A0 =A0 =A0 =A0/* Check for empty space after the corrupt node's common h=
eader */
> =A0 =A0 =A0 =A0skip =3D ALIGN(offs + UBIFS_CH_SZ, c->max_write_size) - of=
fs;
> =A0 =A0 =A0 =A0if (is_empty(buf + skip, len - skip))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
>
> UBIFS_CH_SZ is 64, c->max_write_size is 64, then ALIGN(offs +
> UBIFS_CH_SZ, c->max_write_size) should be 0x2ab3f40, which points to the
> area with all 0xFFs, so 'is_empty' should return 1.
>
> Did you check that your c->max_write_size is 64?
>
> Preserve the image for investigations.
>

Thank you very much. I do not apply this patch: "UBIFS: use
max_write_size during recovery". So the code is "skip =3D ALIGN(offs +
UBIFS_CH_SZ, c->min_io_size) - offs;" the c->min_io_size is 8. When i
modify MTD/UBI/UBIFS and apply that patch,use  c->max_write_size
instead,this problem is solved.I think that patch not just an optimize
but fix this problem. Should we use "fix" in the title of that patch?
By the way, in my machine UBIFS_CH_SZ is 24 not 64.
