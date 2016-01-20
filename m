Received: from mail-yk0-x233.google.com ([2607:f8b0:4002:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM2aq-0002gZ-73
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2016 23:55:17 +0000
Received: by mail-yk0-x233.google.com with SMTP id v14so29759600ykd.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2016 15:54:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADC-h+H=qwue4Ubr7kKOxjweH_0npTwepvnemcnEKAtb3sMPcA@mail.gmail.com>
References: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
 <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
 <56A00CB2.3050505@nod.at>
 <CADC-h+H=qwue4Ubr7kKOxjweH_0npTwepvnemcnEKAtb3sMPcA@mail.gmail.com>
Date: Wed, 20 Jan 2016 15:54:53 -0800
Message-ID: <CAAK6Zt1UCYizAeGZ9E5wtzaEChRfAOVDdQyUzBu=gCx+2mvYaQ@mail.gmail.com>
Subject: Re: Block device emulation on top of ubi volumes with read/write
 support
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Charles Godson <cestgodson@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, w@1wt.eu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 20, 2016 at 3:30 PM, Charles Godson <cestgodson@gmail.com> wrote:
> Thanks for quick reply. I replaced YAFFS2 root file system with SQUASHFS on
> top of UBI [1], and so far it works like a charm. I am currently using UBIFS
> on "user" partitions. Mostly, I needed quota on them, and there was nothing
> in the works about a year ago. I was exploring different avenues: add quota
> support to UBIFS or use [2]. However, I saw that UBIFS quota support is
> introduced somewhere in July [3].
>
> After your explanations and suggestions above, I think ext4 is not really an
> option for me. Since quota support for UBIFS is already in the works, the
> choice is fairly clear :) .
>
> Thanks for your help on this.
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-February/052261.html
> [2] https://lwn.net/Articles/525957/
> [3] https://lwn.net/Articles/651925/
>
> Best regards,
> Charles
>
I was also looking into using squashfs on top of ubiblock, hoping to
write to overwrite a particular entire UBI partition with read-write
ubiblock support. I ended up using separate MTD partitions each
squashfs volume, with an UBI instance on each one, which could then be
updated using the ubi formatting tools, rather than writing through
ubiblock. Maybe UBIFS would be a better design, in retrospect.

Dan
