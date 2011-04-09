Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8Msz-0003un-9p
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2011 01:22:49 +0000
Received: by pwi8 with SMTP id 8so1743794pwi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 18:22:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikp9OAXUFwcvV24x=d7ts3G3VR4yQ@mail.gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
	<BANLkTik9BcPTkgb_AwtmG6TPV1uwSxPP6A@mail.gmail.com>
	<BANLkTikp9OAXUFwcvV24x=d7ts3G3VR4yQ@mail.gmail.com>
Date: Fri, 8 Apr 2011 18:22:47 -0700
Message-ID: <BANLkTi=_yZXkdodpjHgp5=mowWwK-fTTgA@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
From: Russ Dill <russ.dill@gmail.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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

>> I would caution against treating all 0xff blocks as being erased. A
>> partially erased block will often return mostly 0xff, but some of the
>> bits are random. If they return 1, you'll think all is well when it is
>> not. This is why jffs2 has clean-markers. Secondarily, a partially
>> erased block that randomly returns a few bits that match you data to
>> be written would also be bad. In fact, no matter what stage power was
>> lost during an erase cycle, no matter how marginal any percentage of
>> the bits, your tool will smile and nod if it is writing all zeros.
>
> Hm yes.
> I did not consider power loss in a previous erase cycle.
> Actually I assumed that 1's and 0's would be pretty solid and not
> dangling in mid-air.
> Taking that into account it is definitely a must to put it behind an option.
>
> Taking that into account is it still worthwhile/interesting to have this patch?
> Or should I see if I can modify the program in such a way that it only
> erases what is needed
> (the change was triggered by having to copy a kernel image and/or
> initrd and/or rootfs to a partition that was quite overdimensioned)

I think if the data in flash matches the data you are about to write,
its ok to leave it, otherwise I'd erase and rewrite. There are a few
people on this list who have extensive experience with power failure
modes of NOR flash. Hopefully one of them can chime in. From what I
understand about the design of JFFS2 though, the only thing to watch
out for is an eraseblock that looks erased, but in reality isn't fully
erased. I think leaving in the part about checking for changes only
from 1->0 is a bit dangerous, if you leave it in, I'd put a big
warning on it.
