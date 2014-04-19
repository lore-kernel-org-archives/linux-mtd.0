Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbJTh-00021i-Bn
 for linux-mtd@lists.infradead.org; Sat, 19 Apr 2014 00:49:57 +0000
Received: by mail-ve0-f171.google.com with SMTP id jy13so4012173veb.16
 for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2014 17:49:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGVrzcZLUgpZZKAHjPSWaBs6w1XoegLaoWUAaMYUD9zW9yzq0w@mail.gmail.com>
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
 <1397719309-2022-4-git-send-email-computersforpeace@gmail.com>
 <CAGVrzcZLUgpZZKAHjPSWaBs6w1XoegLaoWUAaMYUD9zW9yzq0w@mail.gmail.com>
Date: Fri, 18 Apr 2014 17:49:33 -0700
Message-ID: <CAN8TOE90nh1v_84FSvF8MrN=eR-dOcXAYiOLeqRqXd3JCjfAzw@mail.gmail.com>
Subject: Re: [PATCH 3/5] mips: defconfigs: add MTD_SPI_NOR (new dependency for
 M25P80)
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Linux-MIPS <linux-mips@linux-mips.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 18, 2014 at 5:24 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 2014-04-17 0:21 GMT-07:00 Brian Norris <computersforpeace@gmail.com>:
>> These defconfigs contain the CONFIG_M25P80 symbol, which is now
>> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to the
>> relevant defconfigs.
>
> so CONFIG_M25P80 should select CONFIG_MTD_SPI_NOR, right? in that
> case, I do not think this is needed at all, as it would be
> automatically picked up during the build and if someone refreshes the
> defconfigs, although it cannot hurt.

Can you reply to the cover letter? 3 people have made the same
comment, and I had a rebuttal that I'm not sure if anyone considered
yet.

(And it wouldn't be picked up by 'savedefconfig', since it saves a
minimal .config; when one symbol 'select's another, the latter is not
needed in the defconfig)

Brian
