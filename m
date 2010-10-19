Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P877w-0006nE-16
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2010 08:00:56 +0000
Received: by fxm15 with SMTP id 15so1379804fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Oct 2010 01:00:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] UBIFS: add unstable pages problem description
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <1287396125-1890-1-git-send-email-dedekind1@gmail.com>
References: <1287396125-1890-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Oct 2010 10:57:48 +0300
Message-ID: <1287475068.9272.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-18 at 13:02 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> Describe a problem reported by Matthieu CASTET which is currently
> not handled by UBIFS.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Matthiew, are you happy with this description? Does it properly reflect
your findings? Could you please correct, if not?

I'm starting working on your problem. Since I do not have much time,
I'll do a little everyday, but hope to come up with some patches this
week already. The thing is that it is a lot of work. We need to go
through a lot of UBI/UBIFS subsystems and analyze them.

Why a lot of work? Because we assumed everywhere we can rely on CRC - if
it is correct, we are safe. However, according to you this is not
reliable for unstable pages - you do not have guarantee that next time
you read it you will get correct data.

Also, I do not have HW to test this, so I expect you to help by testing,
are your testing set-ups kept ready? :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
