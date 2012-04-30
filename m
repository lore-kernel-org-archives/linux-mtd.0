Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOwx2-0007wB-Fj
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 20:12:05 +0000
Received: by yenm10 with SMTP id m10so1786537yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2012 13:12:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
 <20120429154707.01c7be55@pixies.home.jungo.com>
 <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
Date: Mon, 30 Apr 2012 13:12:03 -0700
Message-ID: <CAN8TOE8eX-ZACLHiumgD9sZo1Gu7x+K5RDjdjUVV=fGm1HBgzw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] mtd: nand: utilize oob_required parameter
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 30, 2012 at 12:59 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sun, Apr 29, 2012 at 5:47 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
>> - Fix your 02/10 patch, in away that the passed 'oob_required' argument
>> =A0will be somehow set according to the 'snd_cmd'
>
> I'm fine with adding an 'else' to the 'if (likely(sndcmd))', so that
> we get something like this in patch 2:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (likely(sndcmd)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_R=
EAD0, 0x00, page);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sndcmd =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* force driver to read OOB,=
 for sequential read */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oob_required =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> I think that would take care of the corner case where we use autoincremen=
t.

On second thought, this is not good enough. I need to actually check
for CANAUTOINCR(chip). This is a better candidate:

+ /* force read OOB, for auto-incremented read */
+ if (unlikely(NAND_CANAUTOINCR(chip)))
+         oob_required =3D 1;

Brian
