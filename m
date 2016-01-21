Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMBYY-0005nI-Gc
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 09:29:31 +0000
Subject: Re: Block device emulation on top of ubi volumes with read/write
 support
To: Charles Godson <cestgodson@gmail.com>
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
 <CADC-h+HHENRPJi=W4DyOMrmbPeCqu34Jsgux+X7jbHA+B51e_g@mail.gmail.com>
Cc: Daniel Ehrenberg <dehrenberg@google.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Willy Tarreau <w@1wt.eu>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56A0A4DF.3020504@nod.at>
Date: Thu, 21 Jan 2016 10:29:03 +0100
MIME-Version: 1.0
In-Reply-To: <CADC-h+HHENRPJi=W4DyOMrmbPeCqu34Jsgux+X7jbHA+B51e_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.01.2016 um 01:51 schrieb Charles Godson:
> On Wed, Jan 20, 2016 at 4:35 PM, Richard Weinberger <richard@nod.at> wrote:
>>
>> What is your fear?
>> If your NAND is loosing random blocks you are in trouble anyways.
>>
>> Thanks,
>> //richard
> More along the lines of having software blow away first 2K (or
> similar) of my mtd partition (sw bug). I think I would lose everything
> in that case, right? When I have multiple mtd partitions, I would lose
> only one of my file systems. However, all of this probably comes down
> to having backup images, if high availability and reliability is
> required.

If your software kills random blocks you're better with multiple
partitions due to backups...But as the kernel is software too... ;)

Strictly speaking you'd not lose everything after say 2k are gone.
But have to recover the data manually. :)

Thanks,
//richard
