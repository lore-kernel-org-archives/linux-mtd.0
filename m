Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2WoG-0007hl-FB
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 20:36:51 +0000
Received: by yx-out-1718.google.com with SMTP id 6so1037111yxn.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 May 2009 13:36:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <71cd59b00905081332j69ca911fndb112fe31eeec37e@mail.gmail.com>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
	<1241792079.27996.107.camel@localhost.localdomain>
	<71cd59b00905080759o66e8da5awaa0afd76e2064ef8@mail.gmail.com>
	<8bd0f97a0905081158q6e8c446ekeda267198b29facc@mail.gmail.com>
	<71cd59b00905081241n10abd7e7x5e04faaa1fa93355@mail.gmail.com>
	<8bd0f97a0905081325m1d70f040ubb3b2a6ac8f63c05@mail.gmail.com>
	<71cd59b00905081332j69ca911fndb112fe31eeec37e@mail.gmail.com>
Date: Fri, 8 May 2009 16:36:43 -0400
Message-ID: <8bd0f97a0905081336o24ad16e0x661428ca382c44a0@mail.gmail.com>
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Mike Frysinger <vapier.adi@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 8, 2009 at 16:32, Corentin Chary wrote:
> I didn't think of calling make here.

if you want, you can just implement things with updated build paths
and then ask someone (like me) to take a look at parallel/recursive
builds

the build system problem is that it has to be implemented in something
the active community can work with.  the linux-mtd maintainers and
most people who watch it semi-actively can work fine with plain
makefiles.  cmake however does not satisfy those conditions.  i
personally dont mind adding cmake build files so long as someone
volunteers to maintain/update them, but i wouldnt require people
submitting changes to update/test them, only the makefiles.  if the
files get orphaned over time, then they get deleted and we arent stuck
in a situation where we have to migrate back to a build system
everyone knows.
-mike
