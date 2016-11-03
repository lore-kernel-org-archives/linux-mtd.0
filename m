Received: from mail-sn1nam02on0081.outbound.protection.outlook.com
 ([104.47.36.81] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2AJb-0007IX-M0
 for linux-mtd@lists.infradead.org; Thu, 03 Nov 2016 05:11:52 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "Punnaiah Choudary
 Kalluri" <punnaia@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: RE: UBIFS LEB properties tree with odd addresses
Date: Thu, 3 Nov 2016 05:11:20 +0000
Message-ID: <DA6901612C71B84D91459DE817C418AE26E02536@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <e7f63f72-0dc1-54f4-b94c-2efef3e7af6b@nod.at>
 <DA6901612C71B84D91459DE817C418AE26E0069D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <c6e394c9-bbec-1121-7a93-268abcf934bf@nod.at>
In-Reply-To: <c6e394c9-bbec-1121-7a93-268abcf934bf@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

>> Hmm, the calculations in lpt.c use basic properties of the MTD (number o=
f blocks, etc...).
>> Can you please double check which property causes the failure and also v=
erify whether the MTD driver provides correct properties. i.e. page sizes, =
block size, number of blocks, ...

> Hm, these values depend only on basic MTD prperties AFAICT.
> Mtd->numeraseregions =3D 0
> Nor->pagesize =3D 512

As per the above query only, I have given the below inputs.
>Maybe you miss some bit and set incorrect MTD properties.
I double checked the MTD properties (as mentioned above) which were causing=
 the failure, but didn't find any clue.
All mtd properties looks good for dual parallel case(there is no odd value)=
.

Is there any impact by putting below logic in do_calc_lpt_geom() ?
If(c->pnode_sz % 2)
    c->pnode_sz +=3D 1;

please suggest me to do any further debugging?

Thanks,
Naga Sureshkumar Relli



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
