Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov46q-0000ke-EO
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 08:09:53 +0000
Received: by iwn36 with SMTP id 36so4371279iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 01:09:48 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 13 Sep 2010 10:09:48 +0200
Message-ID: <AANLkTimPJqieD4=7zRkN8b=5ktpUY4HBZjaMDJK-7xnr@mail.gmail.com>
Subject: kernel partition table selection
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not sure if this is appropriate for the mtd list, and also not sure on
how to fix it, but wanted to report this anyway.

In the linux mtd kernel config page I can select (for my MPC8536DS board) both:
  [*]     Command line partition table parsing
 <*>     Flash partition map based on OF description

I had expected that if a command line table is specified it would be
used, otherwise the OF one would be used, but apparently OF always
wins.
So either things could be fixed to change the behaviour as stated in
the previous line, or selecting both should not be possible.

Unfortunately I'm not really able to fix this, but wanted to report it anyway.

Best regards, Frans
