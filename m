Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM38Y-0007w6-SM
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 00:30:07 +0000
Received: by mail-io0-x230.google.com with SMTP id 1so37991772ion.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2016 16:29:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56A024A1.3020201@nod.at>
References: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
 <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
 <56A00CB2.3050505@nod.at>
 <CADC-h+H=qwue4Ubr7kKOxjweH_0npTwepvnemcnEKAtb3sMPcA@mail.gmail.com>
 <CAAK6Zt1UCYizAeGZ9E5wtzaEChRfAOVDdQyUzBu=gCx+2mvYaQ@mail.gmail.com>
 <56A02274.3010705@nod.at>
 <CAAK6Zt086TbjFbK70A6nvn=vf0=m3ev3+_2YYQ-c6CyW0oAhag@mail.gmail.com>
 <56A024A1.3020201@nod.at>
Date: Wed, 20 Jan 2016 16:29:45 -0800
Message-ID: <CADC-h+G0GGuUYBM771YfiEc6Vaucj0BUOAk=W9Uk_DLZRqtz-g@mail.gmail.com>
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

On Wed, Jan 20, 2016 at 4:21 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 21.01.2016 um 01:19 schrieb Daniel Ehrenberg:
>> Oh that's right. We considered that, but ultimately decided we wanted
>> to isolate the partitions from each other in terms of wear leveling.
>>
>
> Why that? Usually you want the wear-leveling domain as large as possible.
>
> Thanks,
> //richard

Dan, I am trying to do the opposite: have one UBI container with
multiple volumes (this is similar to hard drive and its partitions).
Wear levelling is going to be spread over the whole flash, and that
should be far better than having smaller mtd partitions. Now I can use
ubi tools to resize volumes, clean them out, reformat them and all of
this on the fly. My only concern is flash corruption. Anyone have the
experience with multi-volume UBI and flash corruption(s)?

Thanks,
Charles
