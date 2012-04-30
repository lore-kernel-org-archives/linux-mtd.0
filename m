Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOwlG-00063T-NY
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:59:55 +0000
Received: by yhjj52 with SMTP id j52so1766684yhj.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2012 12:59:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120429154707.01c7be55@pixies.home.jungo.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
 <20120429154707.01c7be55@pixies.home.jungo.com>
Date: Mon, 30 Apr 2012 12:59:52 -0700
Message-ID: <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
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

On Sun, Apr 29, 2012 at 5:47 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Fri, 27 Apr 2012 18:29:53 -0700 Brian Norris <computersforpeace@gmail.=
com> wrote:
>> Don't read/write OOB if the caller doesn't requre it.
>
> Re-thinking this, I think this might be incorrect.
> Sorry I havn't noticed this earlier.
>
> Suppose the nand chip is working in "sequential" (aka "incremental")
> mode.
> Meaning, a NAND_CMD_READ0 command is issued, and then adjacent pages are
> read sequencially, without having to re-issue NAND_CMD_READ0.
>
> (see for example the loop within 'nand_do_read_ops', especially the
> 'sndcmd' variable).
>
> In that case, we MUST read the 'oob', because the OOB bytes will always
> arrive on the bus following the inband data.
...

I see. This is the kind of issue I was alluding to back in v2:

"For instance, is there any sort of hardware that expects the whole
page + OOB to be read via chip->read_buf() for all reads..."

This situation comes up if NAND_NO_AUTOINCR is not set. But really, it
looks like we *always* have NAND_NO_AUTOINCR enabled, and so we
*always* send a new READ cmd. I know that it's possible for some board
driver to override this, but I don't see that anywhere...

> I have no idea if this issue is also relevant for 'read_page' implementor=
s
> other than of nand_base.c; should carefully review.
>
> There are 2 options for fixing the issue in nand_base.c:
>
> - Disregard the 'oob_required' parameter in all nand_base's
> =A0'read_page' implementations (not future proof, someone might miss the
> =A0nuance; also bug might still exist in the non-default implementations)
>
> - Fix your 02/10 patch, in away that the passed 'oob_required' argument
> =A0will be somehow set according to the 'snd_cmd'

I'm fine with adding an 'else' to the 'if (likely(sndcmd))', so that
we get something like this in patch 2:

               if (likely(sndcmd)) {
                       chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
                       sndcmd =3D 0;
+              } else {
+                      /* force driver to read OOB, for sequential read */
+                      oob_required =3D 1;
               }

I think that would take care of the corner case where we use autoincrement.

Brian
