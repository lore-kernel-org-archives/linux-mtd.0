Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2VHF-0001hM-13
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 18:58:40 +0000
Received: by yx-out-1718.google.com with SMTP id 6so1002718yxn.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 May 2009 11:58:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <71cd59b00905080759o66e8da5awaa0afd76e2064ef8@mail.gmail.com>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
	<1241792079.27996.107.camel@localhost.localdomain>
	<71cd59b00905080759o66e8da5awaa0afd76e2064ef8@mail.gmail.com>
Date: Fri, 8 May 2009 14:58:31 -0400
Message-ID: <8bd0f97a0905081158q6e8c446ekeda267198b29facc@mail.gmail.com>
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

On Fri, May 8, 2009 at 10:59, Corentin Chary wrote:
> I'll see what I can do to use libubi the way I want.
> The problem of using libubi in mkfs is not the includes (we can copy
> the headers in /include or add -I../ubi-utils/include).

why do you need to copy any files ?

> The main problem is that ubi-utils/Makefile make a libubi.a but
> mkfs.ubifs/Makefile have no way to use it

what's wrong with adding -lubi and a -L path ?

> As I'm working on my free time I don't have the time to try to make it
> works with the current buildsystem.
> Mike, have you got any suggestion ?

i dont see the problem

> Maybe moving to autotools instead of CMake could help us ?

we arent using autotools
-mike
