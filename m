Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDfe-00015J-QN
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 10:49:27 +0000
Received: by bwz5 with SMTP id 5so3940561bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 02:49:12 -0800 (PST)
Subject: RE: [PATCH] trivial: nandsim.c spell fixes in comments
From: Artem Bityutskiy <dedekind1@gmail.com>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
In-Reply-To: <AANLkTi=ON7CSbGq=X9wOBNcNjY05-ECJzpjxXFiE0fQM@mail.gmail.com>
References: <AANLkTimGScstLNC2Hs1v-h6BF0y8GFTw4TJw8JEt+j8X@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093EEF9923@Cloud.RL.local>
	<AANLkTi=ON7CSbGq=X9wOBNcNjY05-ECJzpjxXFiE0fQM@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 12:48:59 +0200
Message-ID: <1289645339.2218.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Jon Povey <Jon.Povey@racelogic.co.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-11-02 at 16:20 +0530, srimugunthan dhandapani wrote:
> attached patch fixes the program->programm and other  spellfixes in
> comments in nandsim.c
> 
> Signed-off-by: srimugunthan  <srimugunthan.dhandapani@gmail.com>

I've applied this patch to l2-mtd-2.6.git, but please, next time send
patches so that I could just save the e-mail and apply with git-am. In
this case I had to do a lot of work:

1. Try git-am to the body and fail
2. Check that your attachment matches the body
3. Edit your attachement and add author/signoff-by/etc for you.

But thanks for the fixes anyway.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
