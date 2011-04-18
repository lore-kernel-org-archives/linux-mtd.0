Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBgfj-00080T-NN
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 05:06:52 +0000
Received: by ewy3 with SMTP id 3so1437901ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Apr 2011 22:06:50 -0700 (PDT)
Subject: Re: [nandsim] how to rmmod nandsim or get to know who is using it
From: Artem Bityutskiy <dedekind1@gmail.com>
To: zheng shi <neversetsun@gmail.com>
In-Reply-To: <BANLkTimYunfWMLejECBC5gCJzCtSv_bTCA@mail.gmail.com>
References: <AANLkTin9=ADCP4OQH8Y=6ZKo6CGwTWODz95eUuRsT355@mail.gmail.com>
	<AANLkTimO9guyhUUk8D7i-K=Tt4wF8d+mfFoV29mOZoeD@mail.gmail.com>
	<BANLkTimYunfWMLejECBC5gCJzCtSv_bTCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 08:03:55 +0300
Message-ID: <1303103035.2815.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2011-04-15 at 01:11 +0800, zheng shi wrote:
> Hi All,
> After mtdblock is installed, someone is using nandsim module.
> But I don't know who is using it.
> I have used lsof to check if there's any possible user.
> There's no such problem with linux-2.6.32.

I think this is mtdblock. did you try to rmmod mtdblock?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
