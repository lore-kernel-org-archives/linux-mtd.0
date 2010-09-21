Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oy43M-0005c2-Rx
	for linux-mtd@lists.infradead.org; Tue, 21 Sep 2010 14:42:41 +0000
Received: by wwb24 with SMTP id 24so5820352wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Sep 2010 07:42:39 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: latest MTD-utils
References: <AANLkTin+Y2YD3w4MfdTmQkRyB_UZD8pY51ci4pTQHacB@mail.gmail.com>
	<1285053950.7512.5.camel@localhost>
	<871v8n2osc.fsf@macbook.be.48ers.dk>
	<1285077063.7512.120.camel@localhost>
	<1285077268.7512.121.camel@localhost>
	<87sk131977.fsf@macbook.be.48ers.dk>
	<1285079252.7512.136.camel@localhost>
Date: Tue, 21 Sep 2010 16:42:30 +0200
In-Reply-To: <1285079252.7512.136.camel@localhost> (Artem Bityutskiy's message
	of "Tue, 21 Sep 2010 17:27:32 +0300")
Message-ID: <87mxrb17l5.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bruno Cornec <bruno@project-builder.org>, linux-mtd@lists.infradead.org,
	twebb <taliaferro62@gmail.com>, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

Hi,

 Artem> It is not too difficult to provide tarball, but this is
 Artem> something developers do not care about, they develop. Packagers
 Artem> do care, and it is saner when packagers do this, not developers.

 Artem> I was in LinuxCon Brazil this year, and there was this presentation:
 Artem> http://events.linuxfoundation.org/2010/linuxcon-brazil/cornec

 Artem> where bruno said exactly the same. And he was promoting his
 Artem> project which claims to be able to pick sources from anywhere -
 Artem> git, svn, whatever.

 Artem> So the question is, why Buildroot cannot adjust to the reality
 Artem> (which is that developers in average do not care about tarballs)
 Artem> and cannot be improved?

Sure, buildroot can fetch from git - That's not the problem. All I'm
asking for is a bit of consistency to lower the amount of confusion:

- Either provide tarballs like in the past
- Or clearly state that you don't (website, readme on ftp site) and
  (re)move the old releases so people don't think that's where they are
  supposed to find releases (E.G. google for
  ftp://ftp.infradead.org/pub/mtd-utils/ and see the amount of references)

-- 
Bye, Peter Korsgaard
