Received: from rv-out-0708.google.com ([209.85.198.248])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2Vww-0000W9-KX
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 19:41:45 +0000
Received: by rv-out-0708.google.com with SMTP id c5so1374482rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 May 2009 12:41:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8bd0f97a0905081158q6e8c446ekeda267198b29facc@mail.gmail.com>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
	<1241792079.27996.107.camel@localhost.localdomain>
	<71cd59b00905080759o66e8da5awaa0afd76e2064ef8@mail.gmail.com>
	<8bd0f97a0905081158q6e8c446ekeda267198b29facc@mail.gmail.com>
Date: Fri, 8 May 2009 21:41:36 +0200
Message-ID: <71cd59b00905081241n10abd7e7x5e04faaa1fa93355@mail.gmail.com>
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Corentin Chary <corentin.chary@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, May 8, 2009 at 8:58 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> On Fri, May 8, 2009 at 10:59, Corentin Chary wrote:
>> I'll see what I can do to use libubi the way I want.
>> The problem of using libubi in mkfs is not the includes (we can copy
>> the headers in /include or add -I../ubi-utils/include).
>
> why do you need to copy any files ?
>
>> The main problem is that ubi-utils/Makefile make a libubi.a but
>> mkfs.ubifs/Makefile have no way to use it
>
> what's wrong with adding -lubi and a -L path ?
It'll work only if libubi is already built. You can fix that in the
root Makefile, but
- parallel builds may not work (make -j)
- "cd mkfs.ubifs && make" won't work (using only the mkfs.ubifs Makefile)

But if it's ok for you, I'll just use -L and -lubi.

-- 
Corentin Chary
http://xf.iksaif.net
