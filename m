Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmfAo-0004c6-QZ
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 08:45:40 +0000
Message-ID: <545C8697.3080403@nod.at>
Date: Fri, 07 Nov 2014 09:45:11 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Scott Branden <sbranden@broadcom.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
In-Reply-To: <545BEEA5.7020609@broadcom.com>
Content-Type: text/plain; charset=utf-8
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

Am 06.11.2014 um 22:56 schrieb Scott Branden:
> It looks like the erase happening in the middle of reboot was uncovered in 2009 and never addressed properly?
> 
> https://lkml.org/lkml/2009/6/9/16
> https://lkml.org/lkml/2010/2/12/144
> 
> Was there a proper resolution to this issue?

Did you read the threads you've posted?

There two answers:
https://lkml.org/lkml/2010/2/12/143
https://lkml.org/lkml/2010/2/12/144

Thanks,
//richard
