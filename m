Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCNmE-0003P0-77
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 03:08:26 +0000
Received: by pwi8 with SMTP id 8so231542pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 20:08:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTin0-vPhMSQ0Vy=V07aQ1T+KrRB7zg@mail.gmail.com>
References: <AANLkTin9=ADCP4OQH8Y=6ZKo6CGwTWODz95eUuRsT355@mail.gmail.com>
	<AANLkTimO9guyhUUk8D7i-K=Tt4wF8d+mfFoV29mOZoeD@mail.gmail.com>
	<BANLkTimYunfWMLejECBC5gCJzCtSv_bTCA@mail.gmail.com>
	<1303103035.2815.4.camel@localhost>
	<BANLkTin0-vPhMSQ0Vy=V07aQ1T+KrRB7zg@mail.gmail.com>
Date: Tue, 19 Apr 2011 20:08:23 -0700
Message-ID: <BANLkTi=fZGZem4sqipjOv=M7CSEocLEtWQ@mail.gmail.com>
Subject: Re: [nandsim] how to rmmod nandsim or get to know who is using it
From: Kevin Cernekee <cernekee@gmail.com>
To: zheng shi <neversetsun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 19, 2011 at 7:03 PM, zheng shi <neversetsun@gmail.com> wrote:
> Artem,
> I can't rmmod mtdblock either since it's also in use but have no known user.
> Please have a check of my lsmod result below.
>
> Would you please have a try if nandsim can be rmmod after installation?
> 2.6.35 and mtd-2.6 git tree has such problem but 2.6.32 has no such problem.
> Could it be caused by VFS change?

Might be this problem:

http://lists.infradead.org/pipermail/linux-mtd/2010-July/031029.html

Based on my reading of the history, it was fixed by commit 008c751e so
it would have affected 2.6.35 and 2.6.36.
