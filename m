Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUSOs-00039i-07
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 00:47:34 +0000
Message-ID: <4FB2F8A9.6010909@snapgear.com>
Date: Wed, 16 May 2012 10:45:29 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
In-Reply-To: <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Greg Ungerer <gerg@uclinux.org>, linux-mtd@lists.infradead.org,
 uClinux development list <uclinux-dev@uclinux.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16/05/12 01:57, Mike Frysinger wrote:
> On Tue, May 15, 2012 at 12:08 AM,<gerg@snapgear.com>  wrote:
>> . make the struct uclinux_ram_map static
>
> NAK: this breaks Blackfin systems.  we specifically don't want this to
> be static.
>
> it should probably get a comment added above it saying as much.

A comment won't fix the sparse warning. You need a proper declaration.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
