Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16idgu-0003XT-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 15:50:56 +0000
Message-Id: <200203061602.g26G25w18219@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: MTD concat layer
Date: Wed, 6 Mar 2002 17:02:29 +0100
References: <Pine.LNX.4.21.0202261145590.27658-202000@dagobert.svc.sysgo.de> <1015421827.11575.15.camel@pcjonashg>
In-Reply-To: <1015421827.11575.15.camel@pcjonashg>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Jonas,

Am Mittwoch, 6. März 2002 14:37 schrieben Sie:
> I get an OOPS when erasing (jffs gc). I'm not 100% sure that it's
> something wrong with mtdconcat.c but the same thing works if I use the
> amd_flash driver instead of cfi_cmdset_0002 + mtdconcat. It looks lika a
> busfault in concat_erase. I have disassembled vmlinux and it is
> "subdev->size" on line 663 in mtdconcat.c that gives the busfault, maybe
> because the variable i has been assigned a bad value before entering the
> for loop?
>

Hmm, line 663 is the very last line in mtdconcat.c and it doesn't contain
a reference to subdev->size. Could it be line 279 instead ?

I guess I need to set up an environment here and try to reproduce the problem.
Obviously I do not have access to a cris board, so I'll try with my SC520CDP
instead (I have used it for testing before, but I have so far tested with 
JFFS2 only).

In the meantime, could you verify that the bad pointer is really due to i
going beyond bounds, i.e. add something like:

    if(i >= concat->num_subdev)
        BUG();

before line 276. (actually you can copy-paste it from a few lines above).


Cheers

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
