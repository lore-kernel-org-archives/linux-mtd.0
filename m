Received: from wr-out-0506.google.com ([64.233.184.232])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmvrj-0003CJ-HG
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 12:26:41 -0500
Received: by wr-out-0506.google.com with SMTP id i11so69141wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Nov 2006 09:26:28 -0800 (PST)
Message-ID: <79ac09b60611220926p6b8439a4l62c6037b0d6f67d1@mail.gmail.com>
Date: Wed, 22 Nov 2006 11:26:27 -0600
From: Duke <ezbonites@gmail.com>
To: dedekind@infradead.org
Subject: Re: mtd_debug usage
In-Reply-To: <1164207791.19298.15.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
	<Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
	<79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
	<Pine.LNX.4.64.0611221544030.18210@lnxricardw.se.axis.com>
	<1164207791.19298.15.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/22/06, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2006-11-22 at 15:46 +0100, Ricard Wanderlof wrote:
> > The minor numbers for /dev/mtdX are wrong. /dev/mtd0 should have a minor
> > no. of 0, /dev/mtd1 should have 2, /dev/mtd2 should have 4 etc. The
> > odd-numbered minor numbers are intended for read-only devices.
>
> There is MKDEVS scripts an mtd-utils which can create these.
>

Thanks all,
I got it right now and it does show the correct info.

However, What does the following mean?

#mtd_debug write /dev/mtd2 0x0 0x600000 testfs_cramfs
file_to_flash: fread, size 0x600000, n 0x600000
fread(): Success

Does that mean it will write to mtd2 which starts at physical address
0x200000 (to 0x800000) or does it actually start at physical address
0x0?
 what does the n means?
I'm not writing to flash correctly so maybe I'm missing something.

Thanks.
