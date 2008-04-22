Received: from nf-out-0910.google.com ([64.233.182.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoLdY-0007uA-SV
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 16:46:33 +0000
Received: by nf-out-0910.google.com with SMTP id h3so1682966nfh.22
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Apr 2008 09:46:18 -0700 (PDT)
Message-ID: <480E164F.4000700@gmail.com>
Date: Tue, 22 Apr 2008 20:46:07 +0400
From: Dmitry Krivoschekov <dmitry.krivoschekov@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD][NAND] PXA300 Zylonite controller support
References: <1200289475.1727.106.camel@localhost.localdomain>
	<1208878908.9212.623.camel@pmac.infradead.org>
In-Reply-To: <1208878908.9212.623.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: podstavin@dev.rtsoft.ru, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

David Woodhouse wrote:
> On Mon, 2008-01-14 at 08:44 +0300, Sergey Podstavin wrote:
>> This is a fixed version for pxa3 nand controller from eric miao, 
>> working on pxa300 Zylonite
>
> It doesn't apply, and it contains some very dodgy changes in
> arch/arm/kernel/head.S.
>
> Please can I have a current, working version?
>

can you instead of this consider a more recent (more clean?) version of
that driver submitted by Eric Miao:

http://lists.infradead.org/pipermail/linux-mtd/2008-February/020653.html


Regards,
Dmitry
