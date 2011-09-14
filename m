Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R3hpG-0004JD-TR
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2011 05:15:59 +0000
Received: by bkat2 with SMTP id t2so1305294bka.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2011 22:15:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
	<1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 14 Sep 2011 01:15:36 -0400
Message-ID: <CAMjpGUc4WemgB6sWeChR3dp2mWsaSQUDKmKOfE=C9FBdzfuc1w@mail.gmail.com>
Subject: Re: [PATCH 03/10] nandwrite: consolidate buffer usage
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: b35362@freescale.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 31, 2011 at 16:00, Brian Norris wrote:
> Instead of using two different output buffers for OOB data, let's just
> use the same one for all output. This adds an extra memcpy, but it
> simplifies some future work, so it's worth it.

could it be done by pulling out the pointer ?  make oobbuf a "char *",
rename existing oobbuf to like "char _oobbuf[]", and then assign
oobbuf to the relevant buffer and assume it's always set ...
-mike
