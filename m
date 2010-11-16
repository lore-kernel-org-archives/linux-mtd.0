Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIOys-0000z4-KR
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2010 17:06:07 +0000
Received: by pzk3 with SMTP id 3so52063pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Nov 2010 09:06:04 -0800 (PST)
Message-ID: <4CE2B9F8.3050806@gmail.com>
Date: Tue, 16 Nov 2010 09:06:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 09/10] mtd-utils: nandwrite: full 64-bit support w/
	libmtd
References: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>	
	<1289457554-24155-1-git-send-email-computersforpeace@gmail.com>
	<1289649227.2218.40.camel@localhost>
In-Reply-To: <1289649227.2218.40.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/13/2010 3:53 AM, Artem Bityutskiy wrote:
> You could as well just introduce another libmtd helper - would be
> cleaner, IMO.

OK, I'll look at this and the "simple_strtoll()" suggestion sometime. I
should probably examine "common.h" more before patching mtd-utils next time!

And thanks for the push.

Brian
