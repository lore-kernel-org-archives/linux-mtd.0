Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRzcR-0008AB-S4
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 04:34:52 +0000
Received: by vws8 with SMTP id 8so509176vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 21:34:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306915328.4405.62.camel@localhost>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<1306915328.4405.62.camel@localhost>
Date: Thu, 2 Jun 2011 00:34:50 -0400
Message-ID: <BANLkTinFZqjt5cp8u_Oqmd9B9ycec16Lhg@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 1, 2011 at 4:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> 4. The fixup feature might have broke this - we might for some reason
> read less data than there. Although I see FFs start at offset 416, which
> is strange.
>

Also, I can rule this possibility out - although the device is now
running a recent kernel with the fix-up code present, it was upgraded
last week from an older version.  So the UBIFS image it was originally
programmed with (and is still using) didn't have the fixup flag set.

-- 
Matthew L. Creech
