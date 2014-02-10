Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WClgU-00022x-OD
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 07:53:44 +0000
Message-ID: <52F8856A.6050208@nod.at>
Date: Mon, 10 Feb 2014 08:53:14 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140210012913.GA9505@localhost>
In-Reply-To: <20140210012913.GA9505@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.02.2014 02:29, schrieb Ezequiel Garcia:
>>> +
>>> +               mutex_lock(&dev->vol_mutex);
>>> +               res = do_ubiblock_request(dev, req);
>>> +               mutex_unlock(&dev->vol_mutex);
>>
>> This means that you can never do parallel IO?
>>
> 
> Indeed. Feel free to prepare a follow-up patch improving it,
> once this is merged.

Sorry, this is a very lame argument.

You need to describe why your application design has this flaw.
Modern SoC have very often more than one CPU and many filesystems can to parallel IO.
I'm sure currently the read performance of squashfs suffers because of that.

Thanks,
//richard
