Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5Vp5-0000Xo-5b
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 04:51:15 +0000
Received: by fxg7 with SMTP id 7so4357382fxg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Sep 2011 21:51:13 -0700 (PDT)
Subject: Re: mtd-utils: ubiformat: writing images on flash with badblocks.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anton Olofsson <anol.martinsson@gmail.com>
Date: Mon, 19 Sep 2011 07:53:53 +0300
In-Reply-To: <CAMjE+nUNBEgOFsbLShSTRwEXmYAf9HXi59Kj3O78PEfgzeyWfA@mail.gmail.com>
References: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
	<1315738766.18731.9.camel@sauron>
	<CAMjE+nUNBEgOFsbLShSTRwEXmYAf9HXi59Kj3O78PEfgzeyWfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316408039.24366.49.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-13 at 11:33 +0200, Anton Olofsson wrote:
> As far as I can see this works as expected for both file and pipe input
> and image is written correctly.

Thanks! Pushed to mtd-utils.git.

-- 
Best Regards,
Artem Bityutskiy
