Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRVPh-0001k6-Fa
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 20:19:47 +0000
Received: by fxm14 with SMTP id 14so4423844fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 13:19:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il> <1306387008.2785.138.camel@localhost>
	<BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 31 May 2011 16:19:14 -0400
Message-ID: <BANLkTik0g56VqYLkTDz9dKiPyhg1HMwZUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 31, 2011 at 14:52, Brian Norris wrote:
>> On Thu, 2011-05-26 at 08:14 +0300, Igor Grinberg wrote:
>>> On 05/26/11 00:59, Brian Norris wrote:
>>> pr_err() will save you from the need to define the log level each time.
>>> pr_fmt will save you the need to add %s: and __func__.
>
> Also, it seems that the second statement is not necessarily true. In
> fact, in include/linux/printk.h, we default to the following
> declaration:
> =C2=A0 =C2=A0 #define pr_fmt(fmt) fmt
> So it seems that, when we desire to print out the relevant function
> name, we should manually use __func__ instead of relying on
> pr_fmt...or should we define our own pr_fmt in include/linux/mtd.h?

while it might run afoul of some people's sense of style, it is
technically possible.  try something like this:
#define pr_fmt(fmt) "%s: " fmt, __func__
-mike
