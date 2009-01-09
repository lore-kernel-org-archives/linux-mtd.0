Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LLH2G-0008Tf-PP
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2009 13:04:25 +0000
Message-ID: <49674B57.4030109@grandegger.com>
Date: Fri, 09 Jan 2009 14:04:23 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
References: <496624A4.3050808@grandegger.com>
	<alpine.LFD.2.00.0901081134110.6007@xanadu.home>
	<1231433317.28362.77.camel@macbook.infradead.org>
	<4966310C.1010103@grandegger.com>
	<alpine.LFD.2.00.0901081237460.6007@xanadu.home>
	<49664427.7060801@grandegger.com>
	<alpine.LFD.2.00.0901081330030.6007@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.0901081330030.6007@xanadu.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> On Thu, 8 Jan 2009, Wolfgang Grandegger wrote:
> 
>> Yep, the patch below introduces cfi_fixup_major_minor() to do the quirk. 
>> What do you think now?
> 
> Looks fine to me.

I just resent the patch with a proper description.

Thanks,

Wolfgang.
