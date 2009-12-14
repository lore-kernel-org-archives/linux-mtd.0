Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKC7N-0005WB-3M
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 14:41:49 +0000
Received: by fxm3 with SMTP id 3so3486678fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Dec 2009 06:41:43 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: New mtd-utils release?
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
	<20091214135614.GC16448@hansolo.jdub.homelinux.org>
Date: Mon, 14 Dec 2009 15:41:38 +0100
In-Reply-To: <20091214135614.GC16448@hansolo.jdub.homelinux.org> (Josh Boyer's
	message of "Mon, 14 Dec 2009 08:56:14 -0500")
Message-ID: <87zl5lr525.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@caiaq.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Josh" == Josh Boyer <jwboyer@gmail.com> writes:

Hi,

 Josh> I've avoided doing a release because there isn't a really good
 Josh> way to correlate mtd-utils to kernel version.  I don't believe
 Josh> there have been any on-disk (Ha!) UBIFS format changes, and UBI
 Josh> itself hasn't had format changes for a long time, so it is
 Josh> probably safe to do that now.

Well, you'll have those version issues anyway - With known-good git
SHA1's or releases. Adding a release would just make more people use the
same revision, instead of people using git head of whatever day they
needed mtd-utils.

 Josh> (Also, I believe nandwrite is _STILL_ broken with the OOB stuff.)

Ok, what is the issue? Anyone working on fixing it? Did it work back in
1.2.0?

-- 
Bye, Peter Korsgaard
