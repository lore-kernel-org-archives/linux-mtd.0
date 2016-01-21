Received: from mail-ig0-x242.google.com ([2607:f8b0:4001:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM3U0-0004HM-DX
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 00:52:17 +0000
Received: by mail-ig0-x242.google.com with SMTP id ik10so2970155igb.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2016 16:51:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56A027BF.8000804@nod.at>
References: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
 <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
 <56A00CB2.3050505@nod.at>
 <CADC-h+H=qwue4Ubr7kKOxjweH_0npTwepvnemcnEKAtb3sMPcA@mail.gmail.com>
 <CAAK6Zt1UCYizAeGZ9E5wtzaEChRfAOVDdQyUzBu=gCx+2mvYaQ@mail.gmail.com>
 <56A02274.3010705@nod.at>
 <CAAK6Zt086TbjFbK70A6nvn=vf0=m3ev3+_2YYQ-c6CyW0oAhag@mail.gmail.com>
 <56A024A1.3020201@nod.at>
 <CADC-h+G0GGuUYBM771YfiEc6Vaucj0BUOAk=W9Uk_DLZRqtz-g@mail.gmail.com>
 <56A027BF.8000804@nod.at>
Date: Wed, 20 Jan 2016 16:51:55 -0800
Message-ID: <CADC-h+HHENRPJi=W4DyOMrmbPeCqu34Jsgux+X7jbHA+B51e_g@mail.gmail.com>
Subject: Re: Block device emulation on top of ubi volumes with read/write
 support
From: Charles Godson <cestgodson@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Daniel Ehrenberg <dehrenberg@google.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 20, 2016 at 4:35 PM, Richard Weinberger <richard@nod.at> wrote:
>
> What is your fear?
> If your NAND is loosing random blocks you are in trouble anyways.
>
> Thanks,
> //richard
More along the lines of having software blow away first 2K (or
similar) of my mtd partition (sw bug). I think I would lose everything
in that case, right? When I have multiple mtd partitions, I would lose
only one of my file systems. However, all of this probably comes down
to having backup images, if high availability and reliability is
required.

Cheers,
Charles
