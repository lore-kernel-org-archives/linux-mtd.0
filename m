Received: from mail-vb0-x22f.google.com ([2607:f8b0:400c:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve8J6-0000gy-RF
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 18:58:25 +0000
Received: by mail-vb0-f47.google.com with SMTP id m10so3683719vbh.20
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 10:58:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AsQELFqmRO95GACR90XurovYW8LHUtKfHaiqEhxWnSSw@mail.gmail.com>
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
 <1383758172-29798-2-git-send-email-festevam@gmail.com>
 <CAN8TOE8GZyL6T7XdFyPrNozT2hAXawUqmVFRBX=xgYyHu4fS-Q@mail.gmail.com>
 <CAOMZO5AsQELFqmRO95GACR90XurovYW8LHUtKfHaiqEhxWnSSw@mail.gmail.com>
Date: Wed, 6 Nov 2013 10:58:02 -0800
Message-ID: <CAN8TOE-qtxmBjrS2aGUzSirOJE7S4uHzqjXcKL+NhthPRM-2Wg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: Revert "mtd: gpmi: remove the nand_scan()"
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Fabio Estevam <fabio.estevam@freescale.com>, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 6, 2013 at 10:42 AM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Nov 6, 2013 at 4:08 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> I seriously doubt that a total revert is the correct answer to this
>> problem. Can you pick up the discussion with Huang on the mailing
>
> Agree that it would be better to come up with a better localized fix
> rather than the complete revert, but I currently don't have the time
> to spend on debugging this issue.

OK. And if Huang doesn't have the time to clean up his mess, then we
will have to revert things.

> On the other hand, I would not like to see mx23 broken in 3.12 because
> of this. It can't even reach the prompt.

3.12 is already out the door, so we now have some time to get a proper
fix into -stable.

>> list, or at least explain what the actual root cause is? Have you been
>> going through some private communication on this issue? A proper
>> bugfix with an identified issue is preferable to a blind revert.
>
> No private communication. I reported this issue in the mailing list:
> http://lists.infradead.org/pipermail/linux-mtd/2013-November/049641.html

Right. But this ended with you pointing Huang to the right U-boot
setup, then everything went silent. And today, I get a blunt revert
request from you as well as an independent DMA fix from Huang. Since
you guys are both from Freescale, I wasn't sure if there was any
coordination/correlation, or if this is really as uncoordinated as it
looks.

Brian
