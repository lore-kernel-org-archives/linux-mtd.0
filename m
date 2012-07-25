Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StzjH-0005jI-Bs
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2012 11:26:13 +0000
Received: by bkcji2 with SMTP id ji2so432731bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2012 04:26:07 -0700 (PDT)
Date: Wed, 25 Jul 2012 14:26:02 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Diego COSTE <diego.coste@st.com>
Subject: Re: gluebi and flash file systems using the OOB
Message-ID: <20120725142602.3d7d7dd0@pixies.home.jungo.com>
In-Reply-To: <500FCB91.30009@st.com>
References: <500FCB91.30009@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Diego,

On Wed, 25 Jul 2012 12:33:53 +0200 Diego COSTE <diego.coste@st.com> wrote:
> But we also have to use alternate flash file systems (JFFS2, YAFFS2).
> Unfortunately these file systems use the OOB and therefore can't
> directly work with the HW we use.

You should consider using UBIFS if possible.

> Then I saw that there is gluebi that re-exports a MTD, and that it is
> possible to use JFFS2 on top of it.

Gluebi exports a virtual MTD for each UBI volume.
This MTD's type is MTD_UBIVOLUME.
It is not a NAND MTD (MTD_NANDFLASH) - it does not have bad blocks,
pages, and oob part. It "resembles" NOR flash.

> Does gluebi provide an OOB emulation so that we can use *any* flash file
> system that uses the OOB ?

No.

Note JFFS2 works on top of NOR MTDs (and as such, doesn't use OOB).
So it *should* work on an MTD_UBIVOLUME as well.

However if jffs2 is mounted on MTD_NANDFLASH, it utilizes the OOB.

I remember reading something about inband tags for yaffs2.
Don't know the exact status of this; I think you should take a look.

Regards
Shmulik
