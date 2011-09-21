Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Ixb-0005Pj-EX
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 09:19:19 +0000
Received: by yxi11 with SMTP id 11so1146186yxi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 02:19:18 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Sep 2011 11:19:18 +0200
Message-ID: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
Subject: mount options for jffs2
From: Folkert van Heusden <folkert.van.heusden@gmail.com>
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

Hi,

While hunting a database (SQLite) corruption issue (on jffs2) I
noticed that mount not only accepts barier=1 and data=journal but
test123 and test456 as well.
So I was wondering what mount options are supported for jffs2? I use
linux kernel version 2.6.19.
Also: anyone got experience with sqlite on jffs2? If so: how did you
solve these nasty corruptions?


Folkert.
