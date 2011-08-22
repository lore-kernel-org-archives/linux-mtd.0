Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvaza-00052X-Fk
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 20:21:07 +0000
Received: by wyh11 with SMTP id 11so4610954wyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 13:21:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314002821.2644.77.camel@sauron>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-4-git-send-email-computersforpeace@gmail.com>
	<1314002821.2644.77.camel@sauron>
Date: Mon, 22 Aug 2011 13:21:03 -0700
Message-ID: <CAN8TOE9v62BAUY6bmoSLij1pgK8Sgc+mh1pdY17eVwN=cqcJFg@mail.gmail.com>
Subject: Re: [RFC 3/5] mtd: do not assume oobsize is power of 2
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 1:46 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> Once you double checked that you caught all the places which assume
> power-of-2 and do things like "x & (mtd->oobsize - 1", and once you
> confirmed that you did some basic test by running few nandwrite commands
> which involve OOB operations, I think this patch can go in
> independently.

I'll do a little more combing through the code and perform some
independent tests for this patch, then either resend an amended patch
or comment back here.

> IOW, this does need to be RFC, IMO.

I agree. I think I lumped it in with the others because I discovered
it as a byproduct of my work on the other patches in this series.

Brian
