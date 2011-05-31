Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRWmu-0003aZ-1F
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 21:47:52 +0000
Received: by vxd2 with SMTP id 2so4576902vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 14:47:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
Date: Tue, 31 May 2011 17:47:19 -0400
Message-ID: <BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Content-Type: text/plain; charset=ISO-8859-1
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 31, 2011 at 12:10 PM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
>
> Interesting -- does the trailing 0xff have ECC set, or is it erased
> pages of 0xff?
>
...
>
> Could it be possible that writing the page was interrupted? I guess
> the CRC checks above decompress would catch that though.
>

I verified by adding a call to ubi->mtd->read_oob(): the 0xff data
starts on a page boundary (a whole multiple of 2k in my case).  The
associated OOB area for that page is all 0xff as well.

So I guess this is less about the original LZO error, and more about
how a page in the middle of a UBIFS node got erased out from
underneath it.  Which seems suspiciously similar to the
ubifs_read_node() error which I reported last year:

http://lists.infradead.org/pipermail/linux-mtd/2010-July/031069.html

and which is still showing up from time to time on devices in the
field.  In that case the erased page contained the node header and so
"type" was interpreted as 255; in this case the erased page is in the
middle of a data node, resulting in decompression failure instead.

Unfortunately it's not repeatable enough for us to capture adequate
debug output - we've had several devices logging extensive debug
output via netconsole for months now, but none have recreated this
problem so far under those conditions.

-- 
Matthew L. Creech
