Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OM0He-0003lb-Fh
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 15:00:07 +0000
Received: by ywh42 with SMTP id 42so4058400ywh.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Jun 2010 08:00:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1276006648.5677.20.camel@localhost>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
	<AANLkTin31PwUfXVHGV89VGrWG89RbIcY1L1I_VEO7mSk@mail.gmail.com>
	<1276006648.5677.20.camel@localhost>
Date: Tue, 8 Jun 2010 11:00:04 -0400
Message-ID: <AANLkTilYTO_TgJMVrkmY1yAUK5dGTjyzgNIhndNui3r1@mail.gmail.com>
Subject: Re: UBIFS failed to recover master node
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 8, 2010 at 10:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2010-06-08 at 09:44 -0400, twebb wrote:
>> I've attached a log file that captures the problem I'm seeing.
>
> twebb, you did not enable debugging messages. But it looks like they are
> not actually needed.

I config'd kernel with...
CONFIG_MTD_UBI_DEBUG=3Dy
CONFIG_UBIFS_FS_DEBUG=3Dy

Did I miss something else?

>
>> =A0 The
>> log includes failures on 2 of 4 UBIFS volumes that are part of a
>> single MTD device (and shows the other 2 volumes being
>> mounted/umounted without error).
>>
>> It appears from the log that the problem is associated with "corrupt
>> empty space" which can be seen in the log at lines 28, 313, 347, and
>> 359. =A0Could this be HW ECC failing to correct bit errors on reads?
>> Any suggestions on what this problem would be helpful.
>
> Yes, HW fails to correct bit errors. Why these errors are there - this
> it the question. May be MLC-related. You need to debug this. Or send me
> your board, I can try to take a look

I'll look into it, thanks.

>
> Did you enable UBI extra self checks?
>

No.
