Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohilt-0006aB-T5
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 12:45:07 +0000
Received: by fxm3 with SMTP id 3so5475132fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Aug 2010 05:45:04 -0700 (PDT)
Subject: Re: [PATCH 5/7] UBIFS: do not look up junk nodes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4C5D4C5D.3090204@nokia.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
	<1281169577-18664-6-git-send-email-dedekind1@gmail.com>
	<4C5D4C5D.3090204@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 07 Aug 2010 15:45:01 +0300
Message-Id: <1281185101.1175.78.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian, thanks for review!

On Sat, 2010-08-07 at 15:06 +0300, Adrian Hunter wrote:
> Artem Bityutskiy wrote:
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > 
> > When moving nodes, do not try to look up truncation and padding nodes in TNC,
> > because they do not exist there. This bug was most probably harmless, because
> > the TNC look-up probably failed for all padding and truncation nodes, but it
> 
> The scan does not return padding nodes.

Oh yes.

> > could also succeed and lead to various "interesting" errors.
> 
> Why would it succeed?

In 'ubifs_add_snod()' we call call 'key_read(c, &ino->key, &snod->key)'
for truncation nodes. However, 'struct ubifs_trun_node' does not have
key, so we read something else, and may happen to succeed in TNC lookup
then.

I guess the 'ubifs_add_snod()' should be fixed. Then key for truncation
nodes will be zero, and TNC lookup wont's succeed for sure, but it is
safer still to avoid look up for anything but data/ino/dent/xent nodes,
I think, no?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
