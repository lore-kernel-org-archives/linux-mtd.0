Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgHS-0001PE-9h
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 07:55:54 +0000
Received: by eyh6 with SMTP id 6so2156004eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 00:55:51 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
	<BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 10:51:26 +0300
Message-ID: <1306914686.4405.53.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-31 at 17:47 -0400, Matthew L. Creech wrote:
> Unfortunately it's not repeatable enough for us to capture adequate
> debug output - we've had several devices logging extensive debug
> output via netconsole for months now, but none have recreated this
> problem so far under those conditions.

How this happens? What do you do? Does this happen after mount when you
first read your data? Or this happens at some point while you stress
testing your system? Or this happens after a power cut?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
