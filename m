Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIRf0-00029m-PI
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2010 19:57:47 +0000
Received: by yxj4 with SMTP id 4so275237yxj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Nov 2010 11:57:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CE2B9F8.3050806@gmail.com>
References: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
	<1289457554-24155-1-git-send-email-computersforpeace@gmail.com>
	<1289649227.2218.40.camel@localhost> <4CE2B9F8.3050806@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 16 Nov 2010 14:57:23 -0500
Message-ID: <AANLkTim7o=NS2MsE59Y3xrRyb7GP1bsvu_njXjMWWPV_@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] mtd-utils: nandwrite: full 64-bit support w/
	libmtd
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 16, 2010 at 12:06, Brian Norris wrote:
> On 11/13/2010 3:53 AM, Artem Bityutskiy wrote:
>> You could as well just introduce another libmtd helper - would be
>> cleaner, IMO.
>
> OK, I'll look at this and the "simple_strtoll()" suggestion sometime. I
> should probably examine "common.h" more before patching mtd-utils next time!

it's an evolving helper, so if you come across generally useful funcs
that are in an app or two, feel free to propose moving them to the
header for all to benefit
-mike
