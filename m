Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uqMG-0006Yc-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 07:43:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AEF5A56.7E57CE22@sis.com.tw> 
References: <3AEF5A56.7E57CE22@sis.com.tw>  <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII> <21813.988381415@redhat.com> <2494.988646431@redhat.com> 
To: Ollie Lho <ollie@sis.com.tw>
Cc: "Shuh C. Chang" <schang@3inet.com>, linux-mtd@lists.infradead.org
Subject: Re: Is DOC Address 0xC8000 Something Special? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 May 2001 07:34:24 +0100
Message-ID: <17857.988785264@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ollie@sis.com.tw said:
>  What was it ?? 

Quadrupling the number of delay cycles in DoC_Delay().

http://lists.infradead.org/pipermail/linux-mtd/2001-April/000488.html

--
dwmw2
