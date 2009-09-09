Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MlJTG-0001Lv-U9
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 09:28:15 +0000
Received: by bwz20 with SMTP id 20so1322532bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Sep 2009 02:28:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OFBEE608EF.84319E73-ONC125762B.0062C1F1-C125762B.0062FE4E@transmode.se>
References: <774508.54364.qm@web110103.mail.gq1.yahoo.com>
	<4AA684A6.1000303@billgatliff.com>
	<OFBEE608EF.84319E73-ONC125762B.0062C1F1-C125762B.0062FE4E@transmode.se>
Date: Wed, 9 Sep 2009 11:28:08 +0200
Message-ID: <71cd59b00909090228y2061596fjb6c24f3011a69b30@mail.gmail.com>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
From: Corentin Chary <corentin.chary@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-mtd@lists.infradead.org,
	Justin Treon <justin_treon@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 8, 2009 at 8:01 PM, Joakim
Tjernlund<joakim.tjernlund@transmode.se> wrote:
> Bill Gatliff <bgat@billgatliff.com> wrote on 08/09/2009 18:21:58:
>>
>> Justin Treon wrote:
>> > For NAND I think there is a simple flow chart to pick your filing syst=
em.
>> >
>> > Do you have a partition bigger than 256 MBytes?
>
> Oh yes, probably 512MB-1GB, possibly more
>
>> > If YES: Use UBIFS (@128 MB you can argue the point)
>> > If NO: Do you have a LOT of RAM?
>> > =A0 =A0If YES: Use YAFFS2 (It is fast, but RAM hungry)
>
> This is news to me. I always had the impression that JFFS2 needed
> more RAM.
>
>> > =A0 =A0If NO: Use JFFS2
>> >
>>
>> With 128MB and/or 1GB partitions, does YAFFS2 use more memory than
>> UBIFS? =A0It does seem to me that YAFFS2 mounts a tad faster, though I
>> haven't broken out the stopwatch or anything (yet).
>
Hi,

First memory usage as nothing to do with mount time.

UBIFS mount time is small, but UBI scan can take some time (see
http://www.linux-mtd.infradead.org/doc/ubi.html#L_scalability ).
If you use YAFFS2 with checkpoints, after a clean unmount, I believe
that mouting can be faster than UBI+UBIFS.
But it will depend how many dir/files you have. YAFFS2 mount time will
increase lineary with the number of objects stored.



--=20
Corentin Chary
http://xf.iksaif.net
