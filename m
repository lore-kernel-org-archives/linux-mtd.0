Received: from mail-vb0-x234.google.com ([2607:f8b0:400c:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve83c-0000Gf-Mo
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 18:42:25 +0000
Received: by mail-vb0-f52.google.com with SMTP id f12so3036397vbg.39
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 10:42:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8GZyL6T7XdFyPrNozT2hAXawUqmVFRBX=xgYyHu4fS-Q@mail.gmail.com>
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
 <1383758172-29798-2-git-send-email-festevam@gmail.com>
 <CAN8TOE8GZyL6T7XdFyPrNozT2hAXawUqmVFRBX=xgYyHu4fS-Q@mail.gmail.com>
Date: Wed, 6 Nov 2013 16:42:02 -0200
Message-ID: <CAOMZO5AsQELFqmRO95GACR90XurovYW8LHUtKfHaiqEhxWnSSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: Revert "mtd: gpmi: remove the nand_scan()"
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Brian,

On Wed, Nov 6, 2013 at 4:08 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> I seriously doubt that a total revert is the correct answer to this
> problem. Can you pick up the discussion with Huang on the mailing

Agree that it would be better to come up with a better localized fix
rather than the complete revert, but I currently don't have the time
to spend on debugging this issue.

On the other hand, I would not like to see mx23 broken in 3.12 because
of this. It can't even reach the prompt.

> list, or at least explain what the actual root cause is? Have you been
> going through some private communication on this issue? A proper
> bugfix with an identified issue is preferable to a blind revert.

No private communication. I reported this issue in the mailing list:
http://lists.infradead.org/pipermail/linux-mtd/2013-November/049641.html

Regards,

Fabio Estevam
