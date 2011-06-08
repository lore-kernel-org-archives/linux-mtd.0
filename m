Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNH0-00023Q-Sm
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:14:35 +0000
Received: by fxm14 with SMTP id 14so705907fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 11:14:32 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307540489.31223.87.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-5-git-send-email-vapier@gentoo.org>
	<1307432463.11104.65.camel@localhost>
	<BANLkTimY1DwxBBi=peQzqwoLktgVna-0KA@mail.gmail.com>
	<1307540489.31223.87.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Jun 2011 14:14:12 -0400
Message-ID: <BANLkTi=T-3AF8oQNKtYGeeVwVOiYoJmWpA@mail.gmail.com>
Subject: Re: [PATCH 5/6] mtdinfo: add regioninfo/sectormap display
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 09:41, Artem Bityutskiy wrote:
> I've just pushed this little patch to make sure the code is more
> readable when you add your changes. Otherwise this "out:" label looks
> ugly.

np; i probably should have done this myself
-mike
