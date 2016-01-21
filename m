Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM30y-0005ei-JT
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 00:22:17 +0000
Subject: Re: Block device emulation on top of ubi volumes with read/write
 support
To: Daniel Ehrenberg <dehrenberg@google.com>
References: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
 <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
 <56A00CB2.3050505@nod.at>
 <CADC-h+H=qwue4Ubr7kKOxjweH_0npTwepvnemcnEKAtb3sMPcA@mail.gmail.com>
 <CAAK6Zt1UCYizAeGZ9E5wtzaEChRfAOVDdQyUzBu=gCx+2mvYaQ@mail.gmail.com>
 <56A02274.3010705@nod.at>
 <CAAK6Zt086TbjFbK70A6nvn=vf0=m3ev3+_2YYQ-c6CyW0oAhag@mail.gmail.com>
Cc: Charles Godson <cestgodson@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, w@1wt.eu
From: Richard Weinberger <richard@nod.at>
Message-ID: <56A024A1.3020201@nod.at>
Date: Thu, 21 Jan 2016 01:21:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAAK6Zt086TbjFbK70A6nvn=vf0=m3ev3+_2YYQ-c6CyW0oAhag@mail.gmail.com>
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

Am 21.01.2016 um 01:19 schrieb Daniel Ehrenberg:
> Oh that's right. We considered that, but ultimately decided we wanted
> to isolate the partitions from each other in terms of wear leveling.
> 

Why that? Usually you want the wear-leveling domain as large as possible.

Thanks,
//richard
